---
title: Диффузионные модели
---

# Диффузионные модели

В этой статье рассматривается общая информация об открытых диффузионных моделях, предназначенных для генерации изображений и видео.

Информацию по конкретным семействам моделей и их производным вы можете найти по ссылкам ниже, либо использовав навигационную панель слева.

## Хронология развития

Ниже представлена хронология выпуска открытых диффузионных моделей и ключевых технологий, которые повлияли на развитие генерации изображений и видео.

<style>
.models-timeline {
    margin: 30px 0;
    font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
}

.timeline-container {
    display: flex;
    justify-content: space-between;
    gap: 20px;
}

.year-column {
    flex: 1;
    position: relative;
}

.models-list {
    display: flex;
    flex-direction: column;
    gap: 12px;
}

.year-header {
    margin-bottom: 20px;
    padding: 4px 0;
    
    text-align: center;
    font-size: 1.8em;
    font-weight: 700;
    color: white;
    
    background: linear-gradient(135deg, #4051b5, #303fa1);
    border-radius: 12px;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
}

.model-card {
    display: block;
    padding: 8px 10px;
    position: relative;
    overflow: hidden;
    
    text-decoration: none;
    color: var(--md-typeset-color); 
    font-weight: 500;
    
    background: var(--md-default-bg-color);
    border-radius: 10px;
    border-left: 4px solid #526cfe;
    box-shadow: 0 3px 10px rgba(0, 0, 0, 0.08);
    text-wrap: nowrap;
    
    transition: all 0.2s cubic-bezier(0.4, 0, 0.2, 1) !important;
}

a.model-card::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    right: 0;
    bottom: 0;
    z-index: 1;
    
    background: linear-gradient(90deg, transparent, rgba(82, 108, 254, 0.1), transparent);
    transition:
        left 0.3s ease !important,
        box-shadow 0.3s ease !important;
}

.timeline-line {
    position: absolute;
    top: 60px;
    bottom: 0;
    left: 50%;
    width: 2px;
    z-index: -1;
    
    background: linear-gradient(to bottom, #526cfe1a, transparent);
    transform: translateX(-50%);
}

a.model-card:hover {
    box-shadow: 0 12px 35px rgba(82, 108, 254, 0.3);
}

/* ================================
   Responsive Design - Mobile & Tablet
   ================================ */
@media (max-width: 1200px) {
    /* Switch to 2x2 grid layout */
    .timeline-container {
        flex-wrap: wrap;
    }
    
    .year-column {
        flex: 1 1 calc(50% - 10px);
        min-width: calc(50% - 10px);
    }
}

@media (max-width: 768px) {
    /* Switch to vertical layout on mobile */
    .timeline-container {
        flex-direction: column;
    }
    
    .year-column {
        flex: 1;
        min-width: auto;
    }
    
    /* Hide timeline line on mobile */
    .timeline-line {
        display: none;
    }
}
</style>

<div class="models-timeline">
    <div class="timeline-container">
        <div class="year-column">
            <div class="year-header">2022</div>
            <div class="models-list">
                <a href="/wiki/nai/models/stable-diffusion-1/" class="model-card">Stable Diffusion v1</a>
                <a href="/wiki/nai/models/stable-diffusion-1/#novelai-v1" class="model-card">NovelAI v1</a>
                <span class="model-card">Stable Diffusion v2</span>
            </div>
            <div class="timeline-line"></div>
        </div>
        <div class="year-column">
            <div class="year-header">2023</div>
            <div class="models-list">
                <a href="/wiki/nai/lora" class="model-card">LoRA</a>
                <a href="/wiki/nai/controlnet" class="model-card">ControlNet</a>
                <a href="/wiki/nai/models/stable-diffusion-xl/" class="model-card">Stable Diffusion XL ⭐</a>
                <a href="/wiki/nai/models/stable-diffusion-1/#easyfluff--hll" class="model-card">EasyFluff + HLL</a>
            </div>
            <div class="timeline-line"></div>
        </div>
        <div class="year-column">
            <div class="year-header">2024</div>
            <div class="models-list">
                <a href="/wiki/nai/models/stable-diffusion-xl/#pony-diffusion-v6-xl" class="model-card">Pony Diffusion v6 XL</a>
                <span class="model-card">Stable Cascade</span>
                <span href="#" class="model-card">Stable Diffusion v3.0</span>
                <span href="#" class="model-card">AuraFlow</span>
                <a href="/wiki/nai/models/flux/" class="model-card">FLUX.1</a>
                <a href="/wiki/nai/models/stable-diffusion-xl/#illustrious-xl" class="model-card">Illustrious-XL v0.1</a>
                <span href="#" class="model-card">Stable Diffusion v3.5</span>
            </div>
            <div class="timeline-line"></div>
        </div>
        <div class="year-column">
            <div class="year-header">2025</div>
            <div class="models-list">
                <span href="#" class="model-card">HunyuanVideo</span>
                <span href="#" class="model-card">Wan 2.1</span>
                <span href="#" class="model-card">Chroma</span>
                <a href="/wiki/nai/models/qwen-image/" class="model-card">Qwen Image</a>
                <a href="/wiki/nai/models/qwen-image/" class="model-card">Qwen Image Edit</a>
                <span href="#" class="model-card">Wan 2.2</span>
                <span href="#" class="model-card">FLUX.1-Krea-dev</span>
                <span href="#" class="model-card">FLUX.1-Kontext-dev</span>
            </div>
            <div class="timeline-line"></div>
        </div>
    </div>
</div>

## FAQ
**Какую модель выбрать для генерации изображений?**  

На момент сентября 2025 самыми популярными и актуальными остаются модели на основе [SDXL](./stable-diffusion-xl.md).

Для SFW генераций без сложного позинга вам так же может быть интересен [FLUX](./flux.md), [Qwen-Image](./qwen-image.md) и WAN 2.2.

---

**Какую модель выбрать для генерации видео?**  

WAN 2.2

## Виды моделей

### Базовые модели

**Базовая модель** — обученная с нуля модель.

Создание базовых моделей требует колоссальных вычислительных ресурсов. В связи с этим, практически не существует базовых моделей, выпущенных энтузиастами. Пока это, по большей части, удел крупных компаний.

!!! warning "Совместимость"
    [LoRA-модели](../lora/index.md) и [ControlNet-модели](../controlnet/index.md) от одних базовых моделей не подходят к другим базовым моделям.

Разные базовые модели потребляют разное количество VRAM.

Таблица актуальна для NVidia:

| Базовая модель      | Минимальный объём VRAM | Рекомендуемый объём VRAM |
| ------------------- | ---------------------- | ------------------------ |
| Stable Diffusion 1  | 4 GB VRAM              | 8 GB VRAM                |
| Stable Diffusion XL | 8 GB VRAM              | 12 GB VRAM               |
| FLUX                | 12 GB VRAM             | 24 GB VRAM               |

### Finetune

**Finetune** — [дообученная]("С английского finetune = тонкая настройка") версия базовой модели.

Обучение файньюнов требует умеренных вычислительных ресурсов (в сравнении с созданием базовых моделей), в связи с чем существует большое количество моделей данного вида, созданных различными группами энтузиастов или одиночками.

**Примеры файнтьюнов**: PonyDiffusion V6 XL, NovelAI V1

### Merge

**Merge** — результат процедуры [слияния]("С английского merge = слияние") нескольких моделей, или модели с [LoRA-моделями](../lora/index.md).

Создание мёрджей не требует процедуры обучения и может быть выполнено в короткие сроки на потребительском ПК, в связи с чем мёрджи являются самым многочисленным видом моделей. Мёрджи создаются при помощи таких утилит как [sd-webui-supermerger](https://github.com/hako-mikan/sd-webui-supermerger).

Во многих случаях используют окончание \*\*\*\*\*Mix в названии.

**Примеры мёрджей**: AutismMix, MeinaMix

### Inpaint

**Inpaint-модель** — модель с дополнительными слоями, натрененированная специально для процесса инпеинта.

Данные модели не подвержены проблеме наличия швов и неконсистентности во время процедур inpaint/outpaint.

**Примеры inpaint-моделей**: [foocus-inpaint](https://huggingface.co/lllyasviel/fooocus_inpaint)

## Вариации моделей

### Формат файла: ckpt vs safetensors
!!! tip "Рекомендация"
    При наличии выбора используй `safetensors`

`.ckpt` - это старый формат моделей. Кроме весов, он содержит исполняемый код на python, который может быть вредоносным. Сейчас встречается редко.

`.safetensors` это более новый формат - он не хранит ничего, кроме весов модели.

### Точность: FP16 vs FP32
!!! tip "Рекомендация"
    При наличии выбора используй `FP16`

??? info "Про экспоненциальную форму записи чисел с плавающей запятой"
    Экспоненциальная форма записи — это представление [вещественных чисел](https://ru.wikipedia.org/wiki/Вещественное_число) в виде двух составляющих:  

    * **Порядок** (англ: exponent) — степень числа
    * **Мантисса** (англ: mantissa, significand или fractional part) — значащие цифры этого числа 
    
    Данная форма записи удобна для представления очень больших и очень малых чисел, а также для унификации их написания.
  
    ![](https://files.catbox.moe/dk7czj.png)

    **Примеры**:

    | Обычная запись | Экспоненциальная форма  |
    | -------------- | ----------------------- |
    | 42             | +4.2e1                  |
    | 149597000      | +1.49597e8              |
    | 0.00000001     | +1e-8                   |
    | -0.00000123    | -1.23e-6                |

**FP16** и **FP32** — это форматы хранения чисел с плавающей запятой.

Формат FP32 использует 32 бита для хранения отдельного числа:

![](https://images.contentstack.io/v3/assets/blt71da4c740e00faaa/blt525a174049046979/65a191066c8ca925fa89b3e2/EXX-blog-fp64-fp32-fp-16-7.jpg?format=webp)

Формат FP16, так же называемый половинной точностью (half-precision), использует 16 бит для хранения отдельного числа:

![](https://images.contentstack.io/v3/assets/blt71da4c740e00faaa/blt29288f563e4ac13d/65a1842492c0768b8ab381af/EXX-blog-fp64-fp32-fp-16-4.jpg?format=webp)

По умолчанию, модели формата FP32 так же загружаются с половинной точностью, поэтому профита от большего размера не будет.

---

Современные модели, такие как FLUX, используют точность **BF16** по умолчанию. Как и в случае FP16, используется 16 бит на одно число, но соотношение используемого количества бит для мантиссы и порядка отличается.

![](https://files.catbox.moe/g4627r.png)

### Избыточные связи: full vs pruned
!!! tip "Рекомендация"
    При наличии выбора используй `pruned`

В pruned версиях удалены избыточные связи внутри нейронки, благодаря чему она занимает меньше места. В теории, это слегка ухудшает качество модели, на практике разница малозаметна.

![](https://miro.medium.com/v2/resize:fit:1400/format:webp/1*rw2zAHw9Xlm7nSq1PCKbzQ.png)

## Составляющие части модели

**Чекпоинт (checkpoint)** — файл, хранящий в себе веса какой-либо модели. В случае картинко-генеративных нейростетей, один чекпоинт может включать в себя сразу несколько нейросетей, необходимых для генерации, а именно: U-Net, Text Encoder и VAE.

### U-Net

**U-Net** — это архитектура сверточой нейронной сети, которая была разработанна для сегментации изображений ещё в далёком 2015 году. В случае картинко-генеративных нейросетей - это та часть модели, которая отвечает за пошаговое преобразование шума в изображение.

### Text Encoder

**Текстовый энкодер (text encoder)** — нейросеть, которая извлекает смысл из текстового промпта и преобразует его в числовой вектор. Схожие по смыслу тексты имеют схожие векторы.

**Примеры текстовых энкодеров**: CLIP, T5.

### VAE

**VAE (Variational AutoEncoder)** — архитектура нейросетей для эффективного сжатия и распаковки данных. В случае картинко-генеративных нейросетей, VAE — это нейронная сеть, которая преобразует RGB-изображение в латентное пространство и обратно.

Подробнее про VAE и латентное пространство [смотри здесь](../vae.md).
