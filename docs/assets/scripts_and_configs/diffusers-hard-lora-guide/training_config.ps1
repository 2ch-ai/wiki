# LoRA retard-friendly train_network script fork v1.4.3
# Актуально по состоянию на версию sd-scripts 0.6.5
# https://2ch.hk/ai

<# ##### Начало конфига ##### #>
# Пути

#$env:CUDA_VISIBLE_DEVICES=1

$output_name = "my-best-waifu-lora" # Название файла (расширение не нужно)
$sd_scripts_dir = "C:\ai\sd-scripts-0.6.5" # Путь к папке с репозиторием kohya-ss/sd-scripts
$ckpt = "C:\ai\nai-nsfw.ckpt" # Путь к чекпоинту (ckpt / safetensors)
$image_dir = "C:\sikret-folder\fap-pictures-with-my-waifu" # Путь к папке с изображениями. Внутри должны находится папки вида N_ConceptName
$output_dir = "C:\ai\my-lora-dir" # Директория сохранения LoRA чекпоинтов
#$vae_path = "F:\lora\stable-diffusion-webui\models\Stable-diffusion\vae-ft-mse-840000-ema-pruned.vae.ckpt" # Путь к VAE
$vae_path = "C:\ai\nai-nsfw.ckpt\sd_vae_84.vae.ckpt"
$logging_dir = "C:\ai\my-lora-logs" # (опционально) Папка для логов
$log_prefix = "$output_name" + "_"
$reg_dir = "" # Путь к папке с регуляризационными изображениями

$is_sd_v2_ckpt = 0 # Поставь '1' если загружаешь SD 2.x чекпоинт
$is_sd_v2_768_ckpt = 0 # Также поставь здесь значение '1', если загружаешь SD 2.x-768 чекпоинт
$clip_skip = 2 # Использовать вывод текстового энкодера с конца N-ного слоя

# Основные настройки
$max_train_epochs = 0 # Число эпох. Не имеет силы при $desired_training_time > 0
$max_train_steps = 8000 # (опционально) Выставьте своё количество шагов обучения. desired_training_time и max_train_epochs должны быть равны нулю чтобы эта переменная имела силу
$train_batch_size = 5 # Количество изображений, на которых идёт обучение, одновременно
                      # Чем больше значение, тем меньше шагов обучения (обучение проходит быстрее), но больше потребление видеопамяти
					  
$resolution = 768 # Разрешение обучения (пиксели)


$optimizer_t = "AdamW8bit" #Выбор оптимайзера, доступные в доках
#$optimizer_args = ""

#$optimizer_t = "DAdaptation " 
#$optimizer_args = """decouple=True"" ""weight_decay=0.01"" ""betas=0.9,0.99"""

#$optimizer_t = "DAdaptAdam" 
#$optimizer_args = """decouple=True"" ""weight_decay=1"" ""betas=0.9,0.99"" ""use_bias_correction=True"""
#$optimizer_args = """decouple=True"" ""weight_decay=0.1"" ""betas=0.9,0.99"" "

$noise_offset = 0

$scale_weight_normals = 2
$min_snr_gamma = 5

# Настройки обучения

$learning_rate = 1e-4 # Скорость обучения
$unet_lr = $learning_rate # Скорость обучения U-Net
$text_encoder_lr = $learning_rate/3 # Скорость обучения текстового энкодера

#$learning_rate = 2e-3 # Скорость обучения
#$unet_lr = $learning_rate # Скорость обучения U-Net
#$text_encoder_lr = $learning_rate/2 # Скорость обучения текстового энкодера

$scheduler = "cosine_with_restarts" # Планировщик скорости обучения. Возможные значения: linear, cosine, cosine_with_restarts, polynomial, constant (по умолчанию), constant_with_warmup
$lr_r_num_cycles = 4 #число циклов рестарта для cosine_with_restarts
#$lr_scheduler_type = "cosine_annealing_warmup.CosineAnnealingWarmupRestarts"
#$lr_scheduler_args = """T_0=400"" ""gamma_min_lr=0.99945"" ""decay=1"" ""down_factor=0.5"" ""warmup_steps=80"" ""cycle_warmup=40"" ""init_lr_ground=True"""

#$lr_warmup_ratio = 0.2 # Отношение количества шагов разогрева планировщика к количеству шагов обучения (от 0 до 1). Не имеет силы при планировщике constant
$network_dim = 64 # Размер (ранк) сети. Чем больше значение, тем больше точность и размер выходного файла
$network_alpha = 64 # Альфа сети. Стандартное значение - 1

#Kohya/Locon/lycoris, закомментировать для подготовки обычной лоры
$locon_dim = 32 # Размер и альфа Convolution матриц/Locon
$locon_alpha = 32
#$network_module = "networks.lora"
$network_module = "lycoris.kohya"
$lycoris_algo = "locon"


$max_token_length = 225 # Максимальная длина токена. Возможные значения: 75 / 150 / 225
$shuffle_caption = 1 # Перетасовывать ли теги в файлах описания, разделённых запятой
$keep_tokens = 1 # Не перетасовывать первые N токенов при перемешивании описаний

$seed = 1488228

$save_precision = "bf16" # Использовать ли пользовательскую точность сохранения, и её тип. Возможные значения: no, float, fp16, bf16
$mixed_precision = "bf16" # Использовать ли смешанную точность для обучения, и её тип. Возможные значения: no, fp16, bf16

$save_every_n_epochs = 1 # Сохранять чекпоинт каждые N эпох
$save_last_n_epochs = 999 # Сохранить только последние N эпох


# Дополнительные настройки
<# $device = "cuda" #> # Какое устройство использовать для обучения. Возможные значения: cuda, cpu
$gradient_checkpointing = 0 # https://huggingface.co/docs/transformers/perf_train_gpu_one#gradient-checkpointing
$gradient_accumulation_steps = 1 # https://huggingface.co/docs/transformers/perf_train_gpu_one#gradient-accumulation
$max_data_loader_n_workers = 2 # Максимальное количество потоков процессора для DataLoader
                               # Чем меньше значение, тем меньше потребление RAM, быстрее старт эпохи и медленнее загрузка данных
                               # Маленькое значение может негативно сказаться на скорости обучения
$do_not_interrupt = 0 # Не прерывать работу скрипта вопросами. По умолчанию включен если выполняется цепочка скриптов
$debug_dataset = 0

# Остальные настройки
$test_run = 0 # Не запускать основной скрипт
$do_not_clear_host = 1 # Не очищать консоль при запуске скрипта
$dont_draw_flags = 0 # Не рисовать флаги
<# ##### Конец конфига ##### #>

[console]::OutputEncoding = [text.encoding]::UTF8
$current_version = "1.4"
if ($do_not_clear_host -le 0) { Clear-Host } 

function Is-Numeric ($value) { return $value -match "^[\d\.]+$" }
function WCO($BackgroundColor, $ForegroundColor, $NewLine) {
    $fc = $host.UI.RawUI.ForegroundColor
    $host.UI.RawUI.ForegroundColor = $ForegroundColor
    if ($args)
	{
		if ($NewLine -eq 1) { Write-Host $args -BackgroundColor $BackgroundColor -ForegroundColor $ForegroundColor -NoNewLine }
		else { Write-Output $args }
	}
    else { $input | Write-Output } 
	$host.UI.RawUI.ForegroundColor = $fc
}
function Word-Ending($value) {
	$ending = $value.ToString()
	if ($ending -ge "11" -and $ending -le "19") { return "й" }
	$ending = $ending.Substring([Math]::Max($ending.Length, 0) - 1)
	if ($ending -eq "1") { return "е" }
	if ($ending -ge "2" -and $ending -le "4") { return "я" }
	if (($ending -ge "5" -and $ending -le "9") -or $ending -eq "0") { return "й" } }
function Write-HostCenter { param($Message) Write-Host ("{0}{1}" -f (' ' * (([Math]::Max(0, $Host.UI.RawUI.BufferSize.Width / 2) - [Math]::Floor($Message.Length / 2)))), $Message) }

# austism
$version_string = "RetardScript/fork v$current_version"
$version_string_length = $version_string.Length
$strl = 0

while ($version_string_length -lt $(($([system.console]::BufferWidth) + $version_string.Length) / 2)) { WCO darkred white 1 " "; $version_string_length += 1 }; WCO darkred white 1 $version_string; $version_string_length = $version_string.Length; while ($version_string_length -lt $(($([system.console]::BufferWidth) + $version_string.Length) / 2 - $version_string.Length % 2 + $([system.console]::BufferWidth) % 2)) { WCO darkred white 1 " "; $version_string_length += 1 }; 

$asci_s = @"

⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣀⣤⡤⣶⡤⣤⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠶⠛⢉⡼⠛⠁⣠⡟⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣠⡤⠖⠛⠉⠉⠽⠓⠒⠓⠒⠿⠉⠛⠒⠦⣤⡀⠀⣠⡶⠋⠁⠀⢠⡟⠀⠀⠴⠟⠛⢳⡆
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⡤⣶⡶⠛⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠻⢯⡀⠀⠀⢀⡏⡆⠀⠀⠀⢀⣼⣋⡅
⠀⠀⠀⠀⠀⠀⠀⠀⢀⣠⠴⠚⠉⣠⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠲⣄⣸⠁⠀⠀⠀⠀⠉⠀⣸⡇
⠀⠀⠀⠀⣀⣠⠴⠞⠋⠀⣀⡴⠟⠁⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠻⣦⣄⠀⠀⠀⢀⣴⠏⠀
⣤⡴⠒⠛⠉⠀⠀⠐⠒⠛⣷⠞⠁⠀⠀⠀⠀⠀⠀⠀⠀⣠⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢳⣌⣛⣒⣤⠿⠟⣶⠆
⢹⣧⡀⠀⠀⠀⠀⠀⠀⣼⢡⠀⠀⠀⠀⠀⠀⠀⠀⠀⣰⠏⠀⠀⠀⠀⠀⠀⠀⠀⣤⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢹⡄⠉⠀⠀⣰⠏⠀
⠀⢿⡷⣄⠀⠀⠀⠀⢰⡷⠋⠀⠀⠀⠀⠀⠀⠀⠀⣠⠏⠀⠀⠀⠀⠀⠀⠀⠀⠀⠸⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⣿⠀⠉⠛⣯⠀⠀
⠀⠈⢷⣈⠙⢶⣒⠛⠋⢠⠞⠀⠀⠀⠀⠀⡴⠀⢠⡏⢀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡇⠀⠀⠀⠀⣇⠀⠀⠀⠀⠀⠀⠀⣿⡦⣴⠟⠁⠀⠀
⠀⠀⠀⢹⡟⠂⠩⠛⢲⡏⠀⠀⠀⠀⠀⢰⡇⣀⣿⠀⢸⠀⠀⠀⠀⠀⠀⡄⠀⠐⢺⢷⠂⠰⡄⠀⢸⡀⠀⠀⠀⠀⠀⠀⠹⣟⡁⠀⠀⠀⠀
⠀⠀⠀⠈⠛⠲⢶⠀⡾⠀⠀⠀⠀⠀⢠⢸⡷⠫⢸⡆⢸⣆⠀⠀⠀⠀⠀⢳⠀⢀⡿⠘⢧⡀⢹⣄⠀⣧⠀⠀⠀⠀⠀⠀⠀⠈⠙⠲⢤⣤⡆
⠀⠀⠀⠀⠀⠀⠈⢹⠁⢰⠀⠀⠀⠀⢸⢸⡅⠀⠀⠻⣎⣿⢦⣀⠀⠀⠀⣸⡀⣼⣷⣾⣿⣿⣾⣿⢦⣿⠀⠀⠀⠀⠀⠀⠀⢷⠦⠴⠖⠋⠁
⠀⠀⠀⠀⠀⠀⠀⢸⠀⢸⡄⠀⠀⠀⣿⠸⣇⠀⠀⠀⠈⠙⠂⠙⠷⣄⣀⣿⠟⢿⣿⡏⣀⡀⢙⣿⣿⣏⡀⠀⠀⠀⠀⢸⡀⠸⡆⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⢸⡀⠀⣿⡀⠀⠀⢸⡷⢿⣶⣶⣦⣍⡢⠀⠀⠀⠀⠙⠀⠀⢸⣟⠉⠽⠿⠍⣻⣿⠟⠀⠀⠀⠀⠀⣸⠁⢰⠇⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠻⣄⣧⡿⢦⣄⡀⣷⠀⠀⠈⠉⠛⠻⢦⠀⠀⠀⠀⠀⠀⠠⠿⠤⠤⠤⢒⡿⠃⣠⡞⠀⠀⠀⣠⡏⢀⡞⠀⠀⠀⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⢀⣬⠟⠁⠀⠉⢉⢻⡇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢴⡯⠴⣺⣿⠀⠀⢀⡴⣿⡖⠋⠀⠀⠀⠀⠀⠀
⠀⠀⠀⠀⢀⣠⡤⠶⠋⠁⠀⠀⠀⢀⡄⠈⢳⣄⠀⠀⠀⠀⠀⠠⣄⣠⣤⣀⡄⠀⠀⠀⠀⠀⢀⡴⠋⣯⣤⠖⠋⠀⢸⡇⠀⠀⠀⠀⠀⠀⠀
⠀⣠⡶⠚⠉⢁⡆⠀⠀⠀⠀⠀⠀⡞⠀⠀⠀⠈⠓⣶⣄⣀⠀⠀⠈⠉⠉⠁⠀⠀⠀⣀⡤⠞⠋⠀⠀⠀⡀⠀⠀⠀⠸⣷⠀⠀⠀⠀⠀⠀⠀
⢸⠟⠀⠀⣴⡟⠀⠀⠀⠀⠀⠀⡼⠀⠀⠀⠀⣴⣿⣿⣤⡉⠛⢿⡖⠦⠤⠤⠖⢛⣿⠋⠀⠀⠀⠀⠀⠀⢳⠀⠀⠀⠀⠹⣷⣄⡀⠀⢀⡀⠀
⢸⠀⠀⢸⡿⠁⢠⡄⠀⠀⠀⠀⡇⠀⠀⢀⡼⠛⠻⣿⣮⣙⣦⡈⣿⣆⠀⠀⢀⡾⠛⢷⣤⡀⠀⠀⠀⠀⢸⠀⠀⠀⢰⡄⠙⣮⡉⠉⠉⠁⠀
⠘⣧⠀⡏⡇⠀⠸⡇⠀⠀⠀⠀⢻⠀⢀⡏⠀⠀⠀⠘⣿⣿⣿⣷⣽⣿⣦⣤⣼⡇⢀⡿⢸⠿⣆⠀⠀⠀⠈⣧⠀⠀⠀⢳⡄⠈⠻⣆⠀⠀⠀
⠀⠈⢷⣇⣧⡀⠀⢹⣄⠀⠀⠀⠈⣇⢸⠁⠀⠀⠀⠀⠨⣿⣿⣿⣿⣆⢹⣆⣸⢡⣿⣷⡟⣠⣿⡀⠀⠀⠀⣿⠀⠀⠀⠀⣿⢆⠀⠘⢷⡀⠀
⠀⠀⠀⠀⠈⠙⠲⢤⣹⣦⣀⠀⠀⠘⡟⠀⠀⠀⠀⠀⠀⠙⣿⣿⣿⣿⣷⣿⣿⣿⣿⣿⣾⠋⠈⢷⡄⠀⢀⡟⠀⠀⠀⠀⢹⡌⢷⡀⠈⢷⡀
⠀⠀⠀⠀⠀⠀⠀⠀⠈⠙⠉⠛⠓⢶⡇⠀⠀⠀⠀⠀⠀⠀⠀⠹⣮⣿⣿⣿⣿⣿⣿⣽⠃⠀⠀⠀⠹⣦⠞⠁⠀⠀⠀⠀⢸⡇⠀⢳⠀⢸⡇
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠉⠉⠉⣿⠻⣏⠀⠀⠀⠀⠀⠀⠈⢳⣄⡀⠀⠀⣀⡾⠃⠀⢸⣇⡞⠁
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⢺⠇⠀⠹⣆⠀⠀⠀⠀⠀⠀⠀⠉⠉⠙⠋⠉⠀⠀⠀⠼⠋⠀⠀
⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢾⣿⣀⣀⣀⣽⠆⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀
"@
ForEach ($aline in $($asci_s -split "`n")) {Write-HostCenter ($aline)}

sleep 1

$total = 0
$is_structure_wrong = 0
$abort_script = 0
$iter = 0
$script_origin = (get-location).path

# paths check
Write-Output "Проверка путей..."
$all_paths = @( $sd_scripts_dir, $ckpt, $image_dir )
if ($reg_dir -ne "") { $all_paths += $reg_dir }
if ($use_vae -ge 1) { $all_paths += $vae_path }
foreach ($path in $all_paths) {
	if ($path -ne "" -and !(Test-Path $path)) {
		$is_structure_wrong = 1
		Write-Output "Путь $path не существует" } }

if ($is_chained_run -ge 1) { $do_not_interrupt = 1 }

# images
if ($is_structure_wrong -eq 0) { Get-ChildItem -Path $image_dir -Directory | ForEach-Object {
	if ($iter -eq 0) { Write-Output "Подсчет количества изображений в папках" }
    $parts = $_.Name.Split("_")
    if (!(Is-Numeric $parts[0]))
    {
		WCO black red 0 "Ошибка в $($_):`n`t$($parts[0]) не является числом"
		$is_structure_wrong = 1
        return
    }
	if ([int]$parts[0] -le 0)
	{
		WCO black red 0 "Ошибка в $($_):`nПовторения в имени папки с изображениями должно быть >0"
		$is_structure_wrong = 1
        return
	}
    $repeats = [int]$parts[0]
    $imgs = Get-ChildItem $_.FullName -Depth 0 -File -Include *.jpg, *.png, *.webp | Measure-Object | ForEach-Object { $_.Count }
	if ($iter -eq 0) { Write-Output "Обучающие изображения:" }
    $img_repeats = ($repeats * $imgs)
    Write-Output "`t$($parts[1]): $repeats повторени$(Word-Ending $repeats) * $imgs изображени$(Word-Ending $imgs) = $($img_repeats)"
    $total += $img_repeats
	$iter += 1
} }

$iter = 0

# regs
if ($is_structure_wrong -eq 0 -and $reg_dir -ne "") { Get-ChildItem -Path $reg_dir -Directory | % { if ($abort_script -ne "y") { ForEach-Object {
    $parts = $_.Name.Split("_")
    if (!(Is-Numeric $parts[0]))
    {
		WCO black red 0 "Ошибка в $($_):`n`t$($parts[0]) не является числом"
		$is_structure_wrong = 1
        return
    }
	if ([int]$parts[0] -le 0)
	{
		WCO black red 0 "Ошибка в $($_):`nПовторения в имени папки с изображениями должно быть >0"
		$is_structure_wrong = 1
        return
	}
    $repeats = [int]$parts[0]
    $reg_imgs = Get-ChildItem $_.FullName -Depth 0 -File -Include *.jpg, *.png, *.webp | Measure-Object | ForEach-Object { $_.Count }
	if ($iter -eq 0) { Write-Output "Регуляризационные изображения:" }
	if ($reg_imgs -eq 0 -and $do_not_interrupt -le 0) {
		WCO black darkyellow 0 "Внимание: папка для регуляризационных изображений присутствует, но в ней ничего нет"
		do { $abort_script = Read-Host "Прервать выполнение скрипта? (y/N)" }
		until ($abort_script -eq "y" -or $abort_script -ceq "N")
		return }
	else {
		$img_repeats = ($repeats * $reg_imgs)
		Write-Output "`t$($parts[1]): $repeats повторени$(Word-Ending $repeats) * $reg_imgs изображени$(Word-Ending $reg_imgs) = $($img_repeats)"
		$iter += 1 }
} } } }

if ($is_structure_wrong -eq 0 -and $abort_script -ne "y")
{
	Write-Output "Количество обучающих изображений с повторениями: $total"
	if ($max_train_epochs -ge 1) {
		Write-Output "Используем количество изображений для вычисления шагов обучения"
		Write-Output "Количество эпох: $max_train_epochs"
		Write-Output "Размер обучающей партии (train_batch_size): $train_batch_size"
		if ($reg_imgs -gt 0)
		{
			$total *= 2
			Write-Output "Количество регуляризационных изображений больше 0: количество шагов будет увеличено вдвое"
		}
		$max_train_steps = [int]($total * $max_train_epochs)
		WCO black gray 1 "Количество шагов обучения (без учета batch size): $total * $max_train_epochs = "; WCO white black 1 "$max_train_steps`n"
	}
	else {
		Write-Output "Используем пользовательское количество шагов обучения"
		WCO black gray 1 "Количество шагов (без учета batch size): "; WCO white black 1 "$max_train_steps`n"
	}
	
	$max_train_steps=$max_train_steps / $train_batch_size
	
	WCO black gray 1 "Количество итераций обучения (с учетом batch size): "; WCO white black 1 "$max_train_steps`n"
	
	# run parameters
	$run_parameters = "--network_module=$network_module --train_data_dir=`"$image_dir`""
	
	# paths
	$image_dir = $image_dir.TrimEnd("\", "/")
	$reg_dir = $reg_dir.TrimEnd("\", "/")
	$output_dir = $output_dir.TrimEnd("\", "/")
	$logging_dir = $logging_dir.TrimEnd("\", "/")
	if ($reg_dir -ne "") { $run_parameters += " --reg_data_dir=`"$reg_dir`"" }
	$run_parameters += " --output_dir=`"$output_dir`" --output_name=`"$output_name`" --pretrained_model_name_or_path=`"$ckpt`""
	if ($is_sd_v2_ckpt -le 0) { Write-Output "Stable Diffusion 1.x чекпоинт" }
	if ($is_sd_v2_ckpt -ge 1) {
		if ($is_sd_v2_768_ckpt -ge 1) {
			$v2_resolution = "768"
			$run_parameters += " --v_parameterization"
		}
		else { $v2_resolution = "512" }
		Write-Output "Stable Diffusion 2.x ($v2_resolution) чекпоинт"
		$run_parameters += " --v2"
		if ($clip_skip -eq -not 1 -and $do_not_interrupt -le 0) {
			WCO black darkyellow 0 "Внимание: результаты обучения SD 2.x чекпоинта с clip_skip отличным от 1 могут быть непредсказуемые"
			do { $abort_script = Read-Host "Прервать выполнение скрипта? (y/N)" }
			until ($abort_script -eq "y" -or $abort_script -ceq "N")
		}
	}
	if ($vae_path -ne "") { $run_parameters += " --vae=`"$vae_path`"" }
	
	# main
	if ($desired_training_time -gt 0) { $run_parameters += " --max_train_steps=$([int]$max_train_steps)" }
	elseif ($max_train_epochs -ge 1) { $run_parameters += " --max_train_epochs=$max_train_epochs" }
	else { $run_parameters += " --max_train_steps=$max_train_steps" }
	$run_parameters += " --train_batch_size=$train_batch_size --resolution=$resolution --save_every_n_epochs=$save_every_n_epochs --save_last_n_epochs=$save_last_n_epochs"
	if ($max_token_length -eq 75) { }
	else {
		if ($max_token_length -eq 150 -or $max_token_length -eq 225) { $run_parameters += " --max_token_length=$($max_token_length)" }
		else { WCO black darkyellow 0 "Неверно указан max_token_length! Используем значение 75" } }
	$run_parameters += " --clip_skip=$clip_skip"
	
	# advanced
	$run_parameters += " --learning_rate=$learning_rate"
	if ($unet_lr -ne $learning_rate) { $run_parameters += " --unet_lr=$unet_lr" }
	if ($text_encoder_lr -ne $learning_rate) { $run_parameters += " --text_encoder_lr=$text_encoder_lr" }
	if (($lr_scheduler_type -ne $null)) { $run_parameters += " --lr_scheduler_type $lr_scheduler_type"  }
		if (($lr_scheduler_args -ne $null)) { $run_parameters += " --lr_scheduler_args $lr_scheduler_args"  }
	else { $run_parameters += " --lr_scheduler=$scheduler" }
	if ($locon_dim -gt 0) {	$run_parameters += " --network_args ""conv_dim=$locon_dim"" ""conv_alpha=$locon_alpha"""}
	if ($lycoris_algo -gt 0) {	$run_parameters += " ""algo=$lycoris_algo"" "}
	#$run_parameters += " --lr_scheduler=$scheduler"
	if ($scheduler -ne "constant") {
		if ($lr_warmup_ratio -lt 0.0) { $lr_warmup_ratio = 0.0 }
		if ($lr_warmup_ratio -gt 1.0) { $lr_warmup_ratio = 1.0 }
		$lr_warmup_steps = [int]([math]::Round($max_train_steps * $lr_warmup_ratio ))
		$run_parameters += " --lr_warmup_steps=$lr_warmup_steps"
	}
	if (($lr_r_num_cycles -ne $null)) { $run_parameters += " --lr_scheduler_num_cycles $lr_r_num_cycles"  }
	
	
	$run_parameters += " --network_dim=$network_dim"
	if ($network_alpha -ne 1) { $run_parameters += " --network_alpha=$network_alpha" }
	$run_parameters += " --seed=$seed"
	if ($shuffle_caption -ge 1) { $run_parameters += " --shuffle_caption" }
	$run_parameters += " --keep_tokens=$keep_tokens"
	
	# additional
	<# $run_parameters += " --device=`"$device`"" #>
	if ($gradient_checkpointing -ge 1) { $run_parameters += " --gradient_checkpointing"  }
	if ($gradient_accumulation_steps -gt 1) { $run_parameters += " --gradient_accumulation_steps=$gradient_accumulation_steps" }
	$run_parameters += " --max_data_loader_n_workers=$max_data_loader_n_workers"
	if ($mixed_precision -eq "fp16" -or $mixed_precision -eq "bf16") { $run_parameters += " --mixed_precision=$mixed_precision" }
	if ($save_precision -eq "float" -or $save_precision -eq "fp16" -or $save_precision -eq "bf16") { $run_parameters += " --save_precision=$save_precision" }
	if ($logging_dir -ne "") { $run_parameters += " --logging_dir=`"$logging_dir`" --log_prefix=`"$log_prefix`"" }
	if ($debug_dataset -ge 1) { $run_parameters += " --debug_dataset" }
	
	$run_parameters += " --optimizer_type=""$optimizer_t"""
	if ($optimizer_args -ne "") { $run_parameters += " --optimizer_args $optimizer_args"}
	
	if ($debug_dataset -ge 1) { $run_parameters += " --debug_dataset" }
		
	$run_parameters += " --caption_extension=`".txt`" --prior_loss_weight=1 --enable_bucket --min_bucket_reso=256 --max_bucket_reso=1536 --xformers --save_model_as=safetensors --cache_latents"
	
	if ($noise_offset -ne 0) { $run_parameters += " --noise_offset=$noise_offset" }
	if ($scale_weight_normals -ne 0) { $run_parameters += " --scale_weight_norms=$scale_weight_normals" }
	if ($min_snr_gamma -ne 0) { $run_parameters += " --min_snr_gamma=$min_snr_gamma" }
	
	#$run_parameters += " --noise_offset=0.1"
	
	if ($TestRun -ge 1) { $test_run = 1 }
	
	# main script
	if ($abort_script -ne "y") {
		sleep -s 0.3
		WCO black green 0 "Выполнение скрипта с параметрами:"
		sleep -s 0.3
		Write-Output "$($run_parameters -split '--' | foreach { if ($_ -ceq '') { Write-Output '' } else { Write-Output --`"$_`n`" } } | foreach { $_ -replace '=', ' = ' })"
		echo $run_parameters >params.txt
		if ($test_run -le 0) {
			Set-Location -Path $sd_scripts_dir
			.\venv\Scripts\activate
			powershell accelerate launch --num_cpu_threads_per_process $max_data_loader_n_workers train_network.py $run_parameters --persistent_data_loader_workers
			deactivate
			Set-Location -Path $script_origin
		}
	}
} 

## chain
#if ($restart -ne 1 -and $abort_script -ne "y") { foreach ($script_string in $script_paths) {
#	$path = $script_string -replace "^[ \t]+|[ \t]+$"
#	if ($path -ne "" -and $path -match "^(?:[a-zA-Z]:[\\\/]|\.[\\\/])(?:[^\\\/:*?`"<>|+][^^:*?`"<>|+]+[^.][\\\/])+[^:\\*?`"<>|+]+(?:[^.:\\*?`"<>|+]+)$")
#	{
#		if (Test-Path -Path $path -PathType "leaf") {
#			if ([System.IO.Path]::GetExtension($path) -eq ".ps1") {
#				if ($TestRun -ge 1) {
#					Write-Output "Запускаем следующий скрипт в цепочке (тестовый режим): $path"
#					powershell -ChainedRun 1 -TestRun 1 -File $path }
#				else {
#					Write-Output "Запускаем следующий скрипт в цепочке: $path"
#					powershell -ChainedRun 1 -File $path }
#			}
#			else { WCO black red 0 "Ошибка: $path не является допустимым скриптом" }
#		}
#		else { WCO black red 0 "Ошибка: $path не является файлом" }
#	}
#} }

# autism2
Write-Output ""
$strl = 0
$version_string_length = $version_string.Length
while ($strl -lt ($([system.console]::BufferWidth))) { $strl += 1; WCO white white 1 " " }; Write-Output ""; $strl = 0; while ($version_string_length -lt $(($([system.console]::BufferWidth) + $version_string.Length) / 2)) { WCO darkblue white 1 " "; $version_string_length += 1 }; WCO darkblue white 1 $version_string; $version_string_length = $version_string.Length; while ($version_string_length -lt $(($([system.console]::BufferWidth) + $version_string.Length) / 2 - $version_string.Length % 2 + $([system.console]::BufferWidth) % 2)) { WCO darkblue white 1 " "; $version_string_length += 1 }; while ($strl -lt ($([system.console]::BufferWidth))) { $strl += 1; WCO darkred white 1 " " }
Write-Output "`n"
sleep 3

#29.05.23