---
title: Qwen-Image
---

# Qwen-Image

**Qwen-Image** — модель для генерации изображений из текстового описания, разработанная командой Qwen и выпущенная в августе 2025 года.

**Qwen-Image-Edit** — специализированная модель для редактирования существующих изображений на основе текстовых инструкций, выпущена с небольшой задержкой после Qwen-Image.

**Qwen-Image-Edit-2509** — обновлённая версия Qwen-Image-Edit, выпущенная в сентябре 2025 года. Добавлены расширенные возможности редактирования: поддержка нескольких изображений (1-3 изображения одновременно), встроенная поддержка ControlNet (карты глубины, границы, OpenPose), улучшенна консистентность при работе с лицами, объектами и текстом.

Модели представляют собой 20-миллиардные MMDiT (Multi-modal Diffusion Transformer) и отличаются продвинутым пониманием промпта и возможностью генерации текста внутри изображений.

В качестве текстовых инструкций модели поддерживают несколько языков, включая русский.

## Официальные ссылки
- [Офф. репозиторий Qwen-Image](https://huggingface.co/Qwen/Qwen-Image)
- [Офф. репозиторий Qwen-Image-Edit](https://huggingface.co/Qwen/Qwen-Image-Edit)
- [Офф. репозиторий Qwen-Image-Edit-2509](https://huggingface.co/Qwen/Qwen-Image-Edit-2509)
- [Release Notes: Qwen-Image](https://qwenlm.github.io/blog/qwen-image/)
- [Release Notes: Qwen-Image-Edit](https://qwenlm.github.io/blog/qwen-image-edit/)

## Варианты квантования

Оригинальные модели Qwen-Image слишком большие для потребительских видеокарт - они требуют более 40 GB видеопамяти.

По этой причине используются используются кванты - сжатые версии моделей, которые позволяют запускать их на обычных GPU с разумными компромиссами по качеству и скорости.

### FP8 кванты

FP8 - это современный формат представления [чисел с плавающей запятой](https://ru.wikipedia.org/wiki/Экспоненциальная_запись), который позволяет запускать нейронные сети с минимальными потерями качества.

Эти кванты официально поддерживаются в ComfyUI и не требуют установки каких-либо дополнительных нод/пакетов.

**Установка fp8 квантов Qwen Image / Qwen Image Edit (проскроллить вниз):**  
<https://comfyanonymous.github.io/ComfyUI_examples/qwen_image/>

**Особенности**

- ✅ Работает без установки дополнительных нод  
- ✅ Поддержка внешних LoRA  
- ✅ Дополнительное ускорение на 40 и 50 поколениях видеокарт благодаря аппаратной поддержке fp8  
- ❌ Для работы без выгрузки слоёв требуются карта с 24 GB VRAM или выше

### GGUF кванты

GGUF - это формат для сжатия нейронных сетей, который позволяет запускать большие модели на относительно слабых видеокартах.

Идея в том, что модель сжимается с небольшой потерей качества, но зато требует гораздо меньше видеопамяти. Это позволяет запускать Qwen-Image на картах с 12-16 GB VRAM вместо требуемых 24+ GB для fp8.

- [Qwen-Image-GGUF](https://huggingface.co/city96/Qwen-Image-gguf)
- [Qwen-Image-Edit-GGUF](https://huggingface.co/QuantStack/Qwen-Image-Edit-GGUF)
- [Qwen-Image-Edit-2509-GGUF](https://huggingface.co/QuantStack/Qwen-Image-Edit-2509-GGUF)
- [Ноды для поддержки GGUF в ComfyUI](https://github.com/city96/ComfyUI-GGUF)  

**Особенности**

- ✅ Работают на картах с низким числом VRAM ценой деградации качества  
- ✅ Поддержка внешних LoRA  
- ❌ Более медленные на 40/50 поколениях карт в сравнении с fp8  

**Какой GGUF-квант выбрать?**

Ориентируйтесь на эту таблицу, чтобы понять, какой квант влезет в вашу видеокарту:  

![](https://files.catbox.moe/yn4lpn.jpg){ width="700" }

### Nunchaku FP4/INT4

[Nunchaku](https://github.com/nunchaku-tech/nunchaku) - это высокопроизводительный движок для инференса 4-битных нейронных сетей, который обеспечивает значительное ускорение и снижение потребления памяти для диффузионных моделей.

Он оптимизирует диффузионные модели с помощью техники SVDQuant, сжимая их в 3.6 раза по памяти и ускоряя работу в 2-4 раза.

Варианты с fp4-квантами будут особенно интересны владельцам 50 поколения видеокарт, поскольку данные карты обладают аппаратной поддержкой fp4, благодаря чему скорость будет ещё выше.

- [Qwen-Image (Nunchaku)](https://huggingface.co/nunchaku-tech/nunchaku-qwen-image)  
- [Qwen-Image-Edit (Nunchaku)](https://huggingface.co/nunchaku-tech/nunchaku-qwen-image-edit)  
- [Qwen-Image-Edit-2509 (Nunchaku)](https://huggingface.co/nunchaku-tech/nunchaku-qwen-image-edit-2509)  
- [Ноды ComfyUI для поддержки Nunchaku-квантов](https://github.com/nunchaku-tech/ComfyUI-nunchaku)  
- [Дополнительный pip-пакет для поддержки Nunchaku-квантов в ComfyUI](https://nunchaku.tech/docs/nunchaku/installation/installation.html#installing-nunchaku)  
  (без него кастомные ноды работать не будут)

**Особенности**

- ✅ Более агрессивное квантование для экономии VRAM
- ✅ Значительно выше скорость генерации, особенно на картах 50 поколения
- ✅ Готовые варианты со встроенными Lightning LoRA (смотри ниже)
- ❌ Нет поддержки внешних LoRA (планируется добавить)
- ❌ Требует специальной установки в окружение ComfyUI

## Lightning LoRA

- [Скачать на Huggingface](https://huggingface.co/lightx2v/Qwen-Image-Lightning/tree/main)
- [Описание на GitHub](https://github.com/ModelTC/Qwen-Image-Lightning/)

**Lightning LoRA** - это "ускорялки" для Qwen-Image, которые позволяют генерировать картинки в несколько раз быстрее ценой небольшой потери качества.

Работают за счёт сокращения количества шагов диффузии: вместо стандартных 20 шагов достаточно выставить всего 4 или 8 шагов.

Потери качества могут быть заметны на сложных сценах и в мелких деталях (волосы, текст и т.п.), но для большинства задач результат слабо уступает оригиналу.

**Доступные варианты**:

- **4 шага**: быстрее, но ниже качество
- **8 шагов**: медленнее, но выше качество

!!! info "Совместимость Lightning LoRA с квантами"
    **FP8 и GGUF**: подключаются как обычные LoRA в ComfyUI

    **Nunchaku**: внешние LoRA работать не будут, качайте версии чекпоинтов с вшитыми лорами (в названии должно быть lightning)  

## Тренировка

Поскольку диффузионная часть модели содержит 20 миллиардов параметров, тренировка LoRA даже на картах с 24 GB VRAM возможна только при загрузке базовой модели в fp8 точности.

**Тулзы для тренировки**:

- [musubi-tuner](https://github.com/kohya-ss/musubi-tuner) - трейнер от kohya-ss
- [ai-toolkit](https://github.com/ostris/ai-toolkit) - трейнер от ostris
- [flymyai-lora-trainer](https://github.com/FlyMyAI/flymyai-lora-trainer) - специализированный трейнер для Qwen-Image

**Прочее**:

- [Accuracy Recovery Adapters (ARA)](https://huggingface.co/ostris/accuracy_recovery_adapters) - экспериментальная технология от ostris для компенсации потерь точности при квантовании. Позволяет тренировать LoRA на 24 GB GPU (RTX 3090/4090) на 1Мп изображениях
- [Обсуждение тренировки на 24 GB VRAM с помощью ARA на Reddit](https://www.reddit.com/r/StableDiffusion/comments/1mowmfj/fine_tune_qwenimage_with_ai_toolkit_with_24_gb_of/)