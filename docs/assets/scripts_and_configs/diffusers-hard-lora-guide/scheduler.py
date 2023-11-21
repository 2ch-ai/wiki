import math
import warnings
from torch.optim.lr_scheduler import LRScheduler

class CosineAnnealingWarmupRestarts(LRScheduler):

    def __init__(self,
                 optimizer,
                 T_0,
                 T_mult = 1,
                 last_epoch=-1,
                 verbose=False,
                 warmup_steps=1,
                 decay=1,
                 gamma_min_lr : float = 1.,
                 gamma_lr_update_freq: int = 1,
                 down_factor = 1,
                 cycle_warmup = 0,
                 init_lr_ground = False,
                 sin = False
                 ):

        self.count = 0
        self.sin = sin
        self.init_lr_ground = init_lr_ground
        self.cycle_warmup = cycle_warmup
        self.base_lrs_probe = [0, 0]
        self.counter_warmup = cycle_warmup
        self.gamma_lr_update_freq = gamma_lr_update_freq
        self.gamma_min_lr = gamma_min_lr

        if T_0 <= 0 or not isinstance(T_0, int):
            raise ValueError("Expected positive integer T_0, but got {}".format(T_0))
        self.T_0 = T_0
        self.T_i = T_0
        self.T_mult = T_mult
        self.T_cur = last_epoch
        super(CosineAnnealingWarmupRestarts, self).__init__(optimizer, last_epoch, verbose)

        # Decay attributes
        self.decay = decay
        self.initial_lrs = self.base_lrs

        # Warmup attributes
        self.warmup_steps = warmup_steps
        self.current_steps = 0

        self.down_factor = down_factor

    def get_lr(self):
        if not self._get_lr_called_within_step:
            warnings.warn("To get the last learning rate computed by the scheduler, "
                          "please use `get_last_lr()`.", UserWarning)

        if self.last_epoch == 1 and self.init_lr_ground:
            return [0,0]

        if not self.sin:

            if self.T_cur < self.cycle_warmup and self.count > 0:
                # print('get g_warmup')
                return [((base_lr * self.down_factor)) * self.T_cur / self.cycle_warmup + (base_lr * self.down_factor) for base_lr in self.base_lrs]
            else:
                # print(self.T_cur,self.warmup_steps,self.T_i,self.current_steps,self.last_epoch)
                return [
                    (self.current_steps / self.warmup_steps) *
                    ((base_lr * self.down_factor) + (base_lr - (base_lr * self.down_factor)) * (1 + math.cos(math.pi * (self.T_cur - self.cycle_warmup + self.counter_warmup) / (self.T_i - self.cycle_warmup + self.counter_warmup))) / 2)
                    for base_lr in self.base_lrs
                ]
        else:
            # устарело
            return [
                (self.current_steps / self.warmup_steps) *
                ((base_lr * self.down_factor) + (base_lr - (base_lr * self.down_factor)) * (1 + math.cos(math.pi * (self.T_cur - self.T_0 / 2 ) / (self.T_i - self.T_0 / 2))) / 2)
                for base_lr in self.base_lrs
            ]

    def step(self, epoch=None):
        """Step could be called after every batch update"""
        if epoch is None and self.last_epoch < 0:
            epoch = 0

        if self.count > 0:
            self.counter_warmup = 0

        if self.T_cur + 1 == self.T_i:
            if self.verbose:
                print("multiplying base_lrs by {:.4f}".format(self.decay))
            self.base_lrs = [base_lr * self.decay for base_lr in self.base_lrs]
            self.count = self.count + 1
            # print(self.count)

        if epoch is None:
            epoch = self.last_epoch + 1
            if self.last_epoch > self.warmup_steps:
                self.T_cur = self.T_cur + 1

            if self.T_i % self.gamma_lr_update_freq == 0 and self.last_epoch > self.warmup_steps:
                for i in range(len(self.base_lrs)):
                    self.base_lrs[i] *= self.gamma_min_lr

            if self.current_steps < self.warmup_steps:
                self.current_steps += 1

            if self.T_cur >= self.T_i:
                self.T_cur = self.T_cur - self.T_i
                self.T_i = int((self.T_i - self.cycle_warmup) * self.T_mult) + self.cycle_warmup
                self.cycle_warmup = math.floor(self.cycle_warmup * self.T_mult)

        self.last_epoch = math.floor(epoch)

        class _enable_get_lr_call:

            def __init__(self, o):
                self.o = o

            def __enter__(self):
                self.o._get_lr_called_within_step = True
                return self

            def __exit__(self, type, value, traceback):
                self.o._get_lr_called_within_step = False
                return self

        with _enable_get_lr_call(self):
            for i, data in enumerate(zip(self.optimizer.param_groups, self.get_lr())):
                param_group, lr = data
                param_group['lr'] = lr
                self.print_lr(self.verbose, i, lr, epoch)

        self._last_lr = [group['lr'] for group in self.optimizer.param_groups]