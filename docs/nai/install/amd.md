---
title: Установка для AMD
---

# Установка для AMD
Видеокарты фирмы **AMD** не поддерживают CUDA нативно, из-за чего запуск многих популярных нейросетей (таких как Stable Diffusion) может быть сопряжён с рядом трудностей. Производительность при этом более низкая, в сравнении с видеокартами фирмы NVidia.

!!! info "Что такое CUDA?"
    **CUDA** - это программно-аппаратная архитектура, разработанная компанией NVidia. Данная архитекрута позволяет использовать GPU для повышения производительности параллельных вычислений. Она представляет собой набор инструментов и библиотек для работы с графическим процессором.

    Подавляющее большинство библиотек машинного обучения используют CUDA.

По отзывам анонов, [AUTOMATIC1111](https://github.com/AUTOMATIC1111/stable-diffusion-webui) работает с AMD, хоть и не поддерживает его официально. Для запуска можно использовать такие параметры в webui-user.bat:
```
set COMMANDLINE_ARGS=--opt-split-attention --upcast-sampling
```

!!! tip "Windows vs Linux"
    В случае AMD, генерация на **Linux** значительно превосходит скорость генераций на **Windows** (вплоть до двух раз), что происходит за счёт специального ROCm драйвера от AMD и различных оптимизаций.


## Гайды
* [Использование Stable Diffusion с видеокартами AMD](https://rentry.co/SD-amd-gpu) - старый гайд от анона. В треде писали, что предложенный метод сейчас не работает
* [Install and Run on AMD GPUs](https://github.com/AUTOMATIC1111/stable-diffusion-webui/wiki/Install-and-Run-on-AMD-GPUs) - несколько вариантов установки от автора самого популярного UI для Stable Diffusion

## Установка stable-diffusion-webui-amdgpu

1\. Установить [Python 3.10.6](https://www.python.org/downloads/release/python-3106/). Во время установки отметить "Add Python to PATH"

2\. Установить [git](https://git-scm.com/download/win)

3\. Установить [stable-diffusion-webui-amdgpu](https://github.com/lshqqytiger/stable-diffusion-webui-amdgpu) через команду в консоли:

```
git clone https://github.com/lshqqytiger/stable-diffusion-webui-amdgpu.git
```

4\. Отредактировать в файле webui-user.bat параметр COMMANDLINE_ARGS как указано ниже:

Вариант 1:

```
set COMMANDLINE_ARGS=--use-directml
```
Вариант 2 (если всего 4-6GB VRAM):

```
set COMMANDLINE_ARGS=--opt-sub-quad-attention --lowvram --disable-nan-check
```
5\. Запустить webui-user.bat

Остальное как у NVidia - скачиваешь модель (чекпойнт), VAE, лоры, настраиваешь оптимизации и интерфейс под себя.
