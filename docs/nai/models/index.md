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
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    gap: 20px;
}

.timeline-divider {
    grid-column: 1 / -1;
    height: 2px;
    background: linear-gradient(90deg, transparent, #526cfe40, transparent);
    margin: 10px 0;
}

.timeline-divider + .year-column {
    grid-column-start: 2;
}

.year-column {
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
    display: flex;
    align-items: center;
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
}

.model-card::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    right: 0;
    bottom: 0;

    background: linear-gradient(90deg, rgba(82, 108, 254, 0.06), transparent);
    opacity: 0;
    transition: opacity 0.25s ease;
}

.model-card:hover::before {
    opacity: 1;
}

.model-card-title {
    text-decoration: none;
    color: var(--md-typeset-color);
    position: relative;
    z-index: 1;
    transition: color 0.2s ease;
}

a.model-card-title::after {
    content: '';
    position: absolute;
    left: 0;
    bottom: 0;
    width: 0;
    height: 2px;
    background: #526cfe;
    border-radius: 1px;
    transition: width 0.25s ease;
}

a.model-card-title:hover {
    color: #526cfe;
}

a.model-card-title:hover::after {
    width: 100%;
}

.model-card-links {
    display: flex;
    align-items: center;
    gap: 8px;
    margin-left: auto;
    padding-left: 8px;
    position: relative;
    z-index: 1;
}

.model-card-links .hf-link,
.model-card-links .comfyui-link,
.model-card-links .civitai-link {
    width: 20px;
    height: 20px;
    opacity: 0.7;
    transition: opacity 0.2s ease;
}

.model-card-links .hf-link:hover,
.model-card-links .comfyui-link:hover,
.model-card-links .civitai-link:hover {
    opacity: 1;
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


/* ================================
   Responsive Design - Mobile & Tablet
   ================================ */
@media (max-width: 1200px) {
    .timeline-container {
        grid-template-columns: repeat(2, 1fr);
    }

    .timeline-divider + .year-column {
        grid-column-start: auto;
    }
}

@media (max-width: 768px) {
    .timeline-container {
        grid-template-columns: 1fr;
    }

    /* Reverse chronological order on mobile: 2026, 2025, 2024, 2023, 2022 */
    .timeline-container > :nth-child(1) { order: 3; } /* 2024 */
    .timeline-container > :nth-child(2) { order: 2; } /* 2025 */
    .timeline-container > :nth-child(3) { order: 1; } /* 2026 */
    .timeline-container > :nth-child(5) { order: 5; } /* 2022 */
    .timeline-container > :nth-child(6) { order: 4; } /* 2023 */

    .timeline-divider,
    .timeline-line {
        display: none;
    }
}
</style>

<div class="models-timeline">
    <div class="timeline-container">
        <div class="year-column">
            <div class="year-header">2024</div>
            <div class="models-list">
                <div class="model-card">
                    <a href="/wiki/nai/models/stable-diffusion-xl/#pony-diffusion-v6-xl" class="model-card-title">Pony Diffusion v6 XL</a>
                    <span class="model-card-links">
                        <a class="civitai-link" href="https://civitai.com/models/257749/pony-diffusion-v6-xl" target="_blank"></a>
                    </span>
                </div>
                <div class="model-card">
                    <span class="model-card-title">Stable Cascade</span>
                    <span class="model-card-links">
                        <a class="hf-link" href="https://huggingface.co/stabilityai/stable-cascade" target="_blank"></a>
                        <a class="comfyui-link" href="https://comfyanonymous.github.io/ComfyUI_examples/stable_cascade/" target="_blank"></a>
                    </span>
                </div>
                <div class="model-card">
                    <span class="model-card-title">Stable Diffusion v3.0</span>
                    <span class="model-card-links">
                        <a class="hf-link" href="https://huggingface.co/stabilityai/stable-diffusion-3-medium" target="_blank"></a>
                        <a class="comfyui-link" href="https://comfyanonymous.github.io/ComfyUI_examples/sd3/" target="_blank"></a>
                    </span>
                </div>
                <div class="model-card">
                    <span class="model-card-title">AuraFlow</span>
                    <span class="model-card-links">
                        <a class="hf-link" href="https://huggingface.co/collections/fal/auraflow" target="_blank"></a>
                        <a class="comfyui-link" href="https://comfyanonymous.github.io/ComfyUI_examples/aura_flow/" target="_blank"></a>
                    </span>
                </div>
                <div class="model-card">
                    <a href="/wiki/nai/models/flux/" class="model-card-title">FLUX.1</a>
                    <span class="model-card-links">
                        <a class="hf-link" href="https://huggingface.co/black-forest-labs/FLUX.1-dev" target="_blank"></a>
                        <a class="comfyui-link" href="https://comfyanonymous.github.io/ComfyUI_examples/flux/" target="_blank"></a>
                    </span>
                </div>
                <div class="model-card">
                    <a href="/wiki/nai/models/stable-diffusion-xl/#illustrious-xl" class="model-card-title">Illustrious-XL v0.1</a>
                    <span class="model-card-links">
                        <a class="hf-link" href="https://huggingface.co/OnomaAIResearch/Illustrious-xl-early-release-v0" target="_blank"></a>
                        <a class="civitai-link" href="https://civitai.com/models/795765/illustrious-xl" target="_blank"></a>
                    </span>
                </div>
                <div class="model-card">
                    <span class="model-card-title">Stable Diffusion v3.5</span>
                    <span class="model-card-links">
                        <a class="hf-link" href="https://huggingface.co/collections/stabilityai/stable-diffusion-35" target="_blank"></a>
                        <a class="comfyui-link" href="https://comfyanonymous.github.io/ComfyUI_examples/sd3/" target="_blank"></a>
                    </span>
                </div>
                <div class="model-card">
                    <span class="model-card-title">HunyuanVideo</span>
                    <span class="model-card-links">
                        <a class="hf-link" href="https://huggingface.co/tencent/HunyuanVideo" target="_blank"></a>
                        <a class="comfyui-link" href="https://comfyanonymous.github.io/ComfyUI_examples/hunyuan_video/" target="_blank"></a>
                    </span>
                </div>
            </div>
            <div class="timeline-line"></div>
        </div>
        <div class="year-column">
            <div class="year-header">2025</div>
            <div class="models-list">
                <div class="model-card">
                    <span class="model-card-title">Wan 2.1</span>
                    <span class="model-card-links">
                        <a class="hf-link" href="https://github.com/Wan-Video/Wan2.1" target="_blank"></a>
                        <a class="comfyui-link" href="https://comfyanonymous.github.io/ComfyUI_examples/wan" target="_blank"></a>
                    </span>
                </div>
                <div class="model-card">
                    <a href="/wiki/nai/models/lumina-image-2/" class="model-card-title">Lumina Image 2</a>
                    <span class="model-card-links">
                        <a class="hf-link" href="https://huggingface.co/Alpha-VLLM/Lumina-Image-2.0" target="_blank"></a>
                        <a class="comfyui-link" href="https://comfyanonymous.github.io/ComfyUI_examples/lumina2" target="_blank"></a>
                    </span>
                </div>
                <div class="model-card">
                    <span class="model-card-title">Chroma</span>
                    <span class="model-card-links">
                        <a class="hf-link" href="https://huggingface.co/lodestones/Chroma1-HD" target="_blank"></a>
                        <a class="comfyui-link" href="https://comfyanonymous.github.io/ComfyUI_examples/chroma" target="_blank"></a>
                    </span>
                </div>
                <div class="model-card">
                    <a href="/wiki/nai/models/qwen-image/" class="model-card-title">Qwen Image</a>
                    <span class="model-card-links">
                        <a class="hf-link" href="https://huggingface.co/Qwen/Qwen-Image" target="_blank"></a>
                        <a class="comfyui-link" href="https://comfyanonymous.github.io/ComfyUI_examples/qwen_image/" target="_blank"></a>
                    </span>
                </div>
                <div class="model-card">
                    <a href="/wiki/nai/models/qwen-image/" class="model-card-title">Qwen Image Edit</a>
                    <span class="model-card-links">
                        <a class="hf-link" href="https://huggingface.co/Qwen/Qwen-Image-Edit" target="_blank"></a>
                        <a class="hf-link" href="https://huggingface.co/Qwen/Qwen-Image-Edit-2511" target="_blank"></a>
                        <a class="comfyui-link" href="https://comfyanonymous.github.io/ComfyUI_examples/qwen_image/#edit-model-v2509" target="_blank"></a>
                    </span>
                </div>
                <div class="model-card">
                    <a href="/wiki/nai/models/lumina-image-2/#neta-lumina" class="model-card-title">Neta-Lumina</a>
                    <span class="model-card-links">
                        <a class="hf-link" href="https://huggingface.co/neta-art/Neta-Lumina" target="_blank"></a>
                        <a class="civitai-link" href="https://civitai.com/models/1612109/neta-lumina" target="_blank"></a>
                    </span>
                </div>
                <div class="model-card">
                    <span class="model-card-title">Wan 2.2</span>
                    <span class="model-card-links">
                        <a class="hf-link" href="https://huggingface.co/collections/Wan-AI/wan22" target="_blank"></a>
                        <a class="comfyui-link" href="https://comfyanonymous.github.io/ComfyUI_examples/wan22" target="_blank"></a>
                    </span>
                </div>
                <div class="model-card">
                    <span class="model-card-title">FLUX.1-Krea-dev</span>
                    <span class="model-card-links">
                        <a class="hf-link" href="https://huggingface.co/black-forest-labs/FLUX.1-Krea-dev" target="_blank"></a>
                        <a class="comfyui-link" href="https://comfyanonymous.github.io/ComfyUI_examples/flux/" target="_blank"></a>
                    </span>
                </div>
                <div class="model-card">
                    <span class="model-card-title">FLUX.1-Kontext-dev</span>
                    <span class="model-card-links">
                        <a class="hf-link" href="https://huggingface.co/black-forest-labs/FLUX.1-Kontext-dev" target="_blank"></a>
                        <a class="comfyui-link" href="https://comfyanonymous.github.io/ComfyUI_examples/flux/#flux-kontext-image-editing-model" target="_blank"></a>
                    </span>
                </div>
                <div class="model-card">
                    <span class="model-card-title">FLUX.2</span>
                    <span class="model-card-links">
                        <a class="hf-link" href="https://huggingface.co/black-forest-labs/FLUX.2-dev" target="_blank"></a>
                        <a class="comfyui-link" href="https://comfyanonymous.github.io/ComfyUI_examples/flux2/" target="_blank"></a>
                    </span>
                </div>
                <div class="model-card">
                    <span class="model-card-title">Z-Image Turbo</span>
                    <span class="model-card-links">
                        <a class="hf-link" href="https://huggingface.co/Tongyi-MAI/Z-Image-Turbo" target="_blank"></a>
                        <a class="comfyui-link" href="https://comfyanonymous.github.io/ComfyUI_examples/z_image/" target="_blank"></a>
                    </span>
                </div>
            </div>
            <div class="timeline-line"></div>
        </div>
        <div class="year-column">
            <div class="year-header">2026</div>
            <div class="models-list">
                <div class="model-card">
                    <span class="model-card-title">LTX-2</span>
                    <span class="model-card-links">
                        <a class="hf-link" href="https://huggingface.co/Lightricks/LTX-Video" target="_blank"></a>
                        <a class="comfyui-link" href="https://comfyanonymous.github.io/ComfyUI_examples/ltxv/" target="_blank"></a>
                    </span>
                </div>
                <div class="model-card">
                    <span class="model-card-title">FLUX.2 klein</span>
                    <span class="model-card-links">
                        <a class="hf-link" href="https://huggingface.co/black-forest-labs/FLUX.2-klein-4B" target="_blank"></a>
                        <a class="hf-link" href="https://huggingface.co/black-forest-labs/FLUX.2-klein-9B" target="_blank"></a>
                        <a class="comfyui-link" href="https://comfyanonymous.github.io/ComfyUI_examples/flux2/" target="_blank"></a>
                    </span>
                </div>
            </div>
            <div class="timeline-line"></div>
        </div>
        <div class="timeline-divider"></div>
        <div class="year-column">
            <div class="year-header">2022</div>
            <div class="models-list">
                <div class="model-card">
                    <a href="/wiki/nai/models/stable-diffusion-1/" class="model-card-title">Stable Diffusion v1</a>
                    <span class="model-card-links">
                        <a class="hf-link" href="https://huggingface.co/stable-diffusion-v1-5/stable-diffusion-v1-5" target="_blank"></a>
                    </span>
                </div>
                <div class="model-card">
                    <a href="/wiki/nai/models/stable-diffusion-1/#novelai-v1" class="model-card-title">NovelAI v1</a>
                    <span class="model-card-links">
                        <a class="hf-link" href="https://huggingface.co/NovelAI/nai-anime-v1-full" target="_blank"></a>
                    </span>
                </div>
                <div class="model-card">
                    <span class="model-card-title">Stable Diffusion v2</span>
                </div>
            </div>
            <div class="timeline-line"></div>
        </div>
        <div class="year-column">
            <div class="year-header">2023</div>
            <div class="models-list">
                <div class="model-card">
                    <a href="/wiki/nai/lora" class="model-card-title">LoRA</a>
                    <span class="model-card-links">
                        <a class="comfyui-link" href="https://comfyanonymous.github.io/ComfyUI_examples/lora/" target="_blank"></a>
                    </span>
                </div>
                <div class="model-card">
                    <a href="/wiki/nai/controlnet" class="model-card-title">ControlNet</a>
                    <span class="model-card-links">
                        <a class="comfyui-link" href="https://comfyanonymous.github.io/ComfyUI_examples/controlnet/" target="_blank"></a>
                    </span>
                </div>
                <div class="model-card">
                    <a href="/wiki/nai/models/stable-diffusion-xl/" class="model-card-title">Stable Diffusion XL</a>
                    <span class="model-card-links">
                        <a class="hf-link" href="https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0" target="_blank"></a>
                        <a class="comfyui-link" href="https://comfyanonymous.github.io/ComfyUI_examples/sdxl" target="_blank"></a>
                    </span>
                </div>
                <div class="model-card">
                    <a href="/wiki/nai/models/stable-diffusion-1/#easyfluff--hll" class="model-card-title">EasyFluff + HLL</a>
                    <span class="model-card-links">
                        <a class="hf-link" href="https://huggingface.co/CluelessC/hll-test/tree/main/lyco" target="_blank"></a>
                    </span>
                </div>
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
