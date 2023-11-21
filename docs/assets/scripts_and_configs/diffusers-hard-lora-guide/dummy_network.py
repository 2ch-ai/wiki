import torch
import torch.nn as nn
import matplotlib.pyplot as plt
import mplcursors
import scheduler

# create a dump network

class DumpNet(nn.Module):
    def __init__(self):
        super(DumpNet, self).__init__()
        self.conv1 = nn.Conv2d(3, 32, kernel_size=3, padding=1, stride=1)
        self.conv2 = nn.Conv2d(32, 32, kernel_size=3, padding=1, stride=1)
    def forward(self, x):
        x = self.conv1(x)
        x = self.conv2(x)
        return x
# dump network and optimzer
net = DumpNet()

lr_val = [0.0001, 0.000035]
# lr_val = [1.1, 1.1]

# unet_lr = 2e-3
# te_lr = 1e-3
#lr = 0.001

# set different initial learning rate and lambda function for each parameter group
# params = [{'params':net.conv1.parameters()}, {'params':net.conv2.parameters()}]
params = [{'params':net.conv1.parameters()}, {'params':net.conv2.parameters(), 'lr':lr_val[1]}] # второй лр

optimizer = torch.optim.AdamW(params,lr=lr_val[0])
# optimizer = torch.optim.SGD(params,lr=lr_val[0])

max_epoch = 1600 # Ха, наебал, это не эпохи, а шаги


# scheduler = torch.optim.lr_scheduler.CyclicLR(optimizer, base_lr=0.001, max_lr=lr_val[0],
#                                   step_size_up=100, step_size_down=100, mode='exp_range',
#                                   gamma=0.998, scale_fn=None, scale_mode='cycle',
#                                   cycle_momentum=False, base_momentum=0.8, max_momentum=0.9, last_epoch=-1)


# scheduler = torch.optim.lr_scheduler.CosineAnnealingWarmRestarts(optimizer,T_0=500)


scheduler = scheduler_v4.CosineAnnealingWarmupRestarts(optimizer, T_0=400, gamma_min_lr=0.99915, decay=1, down_factor=0.5, warmup_steps=80, cycle_warmup=40, init_lr_ground=True)

# Вариант с околосинусоидой, просто что б было
# scheduler = custom_scheduler.CosineAnnealingWarmupRestarts(optimizer,T_0=250, gamma_min_lr=0.999,decay=1., down_factor=0.5, warmup_steps=1, init_lr_ground=False, sin=True)

# scheduler = shit_scheduler.CosineAnnealingWarmupRestarts(optimizer,first_cycle_steps=250,warmup_steps=125,max_lr=0.002,min_lr=0.0015,gamma=0.8,gamma_min_lr=0.9985,gamma_lr_update_freq=1)

xs = list()
ys = list()
for epoch in range(max_epoch):
    optimizer.step() # deceptive parameter update Оптимайзер вызыватется до шедулера
    scheduler.step()
    current_lr = scheduler.get_last_lr()
    xs.append(epoch)
    ys.append(current_lr)

fig, ax = plt.subplots()
line1, line2 = ax.plot(xs, ys)[:2]
cursor = mplcursors.cursor([line1, line2], hover=True)

@cursor.connect("add")
def on_add(sel):
    x, y = sel.target[0], sel.target[1]
    sel.annotation.set_text(f"({x:.0f}, {y:.2e})")

plt.xlabel('Step')
plt.ylabel('lr')
plt.title('')
plt.grid(True)
plt.show()