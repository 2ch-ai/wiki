python -m venv venv # Создаём виртуальное окружение
.\venv\Scripts\activate # Активируем его

# Устанавливаем torch и torchvision, xformers, а также необходимые зависимости
pip install torch torchvision --index-url https://download.pytorch.org/whl/cu118
pip install --upgrade -r requirements.txt
pip install xformers==0.0.21
pip install dadaptation==3.1 lycoris_lora
pip install bitsandbytes==0.35.0

# Копируем скомпилированные под Windows CUDA библиотеки, вручную или командами. На Linux этот шаг не обязателен
cp .\bitsandbytes_windows\*.dll .\venv\Lib\site-packages\bitsandbytes\
cp .\bitsandbytes_windows\cextension.py .\venv\Lib\site-packages\bitsandbytes\cextension.py
cp .\bitsandbytes_windows\main.py .\venv\Lib\site-packages\bitsandbytes\cuda_setup\main.py

accelerate config