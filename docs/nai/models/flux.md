[[Официальный анонс]](https://blog.fal.ai/flux-the-largest-open-sourced-text2img-model-now-available-on-fal/)

Flux был выпущен 1 августа 2024 года компанией Black Forest Labs.

Данный стартап основан бывшими сотрудниками Stability AI, которые раньше работали над Stable Diffusion.

## Базовые модели
Было анонсировано три модели, веса для двух из них были выложены в паблик.

| Модель               | Веса                                                                   |
| -------------------- | ---------------------------------------------------------------------- |
| **FLUX.1 [dev]**     | [Huggingface](https://huggingface.co/black-forest-labs/FLUX.1-dev)     |
| **FLUX.1 [schnell]** | [Huggingface](https://huggingface.co/black-forest-labs/FLUX.1-schnell) |
| **FLUX.1 [pro]**     | Недоступны                                                             |

Особенностью модели **schnell** является сходимость за низкое число шагов семплинга, что позволяет генерировать изображения быстро, но в ущерб качеству. Согласно офф. документации необходимо всего 1-4 шага.

Модель **pro** доступна только в онлайне по подписочной системе.

## Системные требования
Комфортный минимум для запуска - карта NVidia с 16 GB VRAM в режиме fp8 и выгрузкой T5 на CPU.

## Локальные интерфейсы

!!! info "Информация актуальна на состояние 02.09.2024"

| Интерфейс       | Комментарий                                                                                         |
| --------------- | --------------------------------------------------------------------------------------------------- |
| ✅ Forge         | [Инструкция по запуску](https://github.com/lllyasviel/stable-diffusion-webui-forge/discussions/981) |
| ✅ ComfyUI       | [Инструкция по запуску](https://comfyanonymous.github.io/ComfyUI_examples/flux/)                    |
| ❌ AUTOMATIC1111 | [Пока нет поддержки](https://github.com/AUTOMATIC1111/stable-diffusion-webui/issues/16311)          |
| ❌ reForge       | [Пока нет поддержки](https://github.com/Panchovix/stable-diffusion-webui-reForge/issues/122)        |
| ❌ Fooocus       | [Поддержки нет и не планируется](https://github.com/lllyasviel/Fooocus/issues/3424)                 |

## Запустить в онлайне

### FLUX.1 [schnell]
<https://huggingface.co/spaces/black-forest-labs/FLUX.1-schnell>

### FLUX.1 [dev]
<https://huggingface.co/spaces/black-forest-labs/FLUX.1-dev>

## Тренировка лор
Лоры для Flux можно обучать на потребительском железе с 12-24 GB VRAM, в зависимости от параметров обучения.

### Генерация описаний
Поскольку базовая модель не была обучена на booru-тегах, имеет смысл делать описания изображений для тренировки лор натуртекстом.

Описания можно сгенерировать через VLM, например при помощи InternVL2[ 26В](https://huggingface.co/OpenGVLab/InternVL2-26B)/[40В](https://huggingface.co/OpenGVLab/InternVL2-40B) или с помощью более легковестного [Idefics3-8B-Llama3](https://huggingface.co/HuggingFaceM4/Idefics3-8B-Llama3).

#### Joy Caption
Также описания можно делать при помощи [joy-caption](https://huggingface.co/spaces/fancyfeast/joy-caption-pre-alpha), который представляет из себя адаптер, конвертирующий вывод CLIP в эмбеддинг, совместимый с моделью Meta-Llama-3.1-8B или её производными.

Недостатком Joy Caption является слабое восприятие NSFW-концептов.

Интерфейсы для joy-caption:  

- joy-caption-pre-alpha: <https://huggingface.co/spaces/fancyfeast/joy-caption-pre-alpha>  
- joy-caption-batch: <https://github.com/MNeMoNiCuZ/joy-caption-batch>  
- taggui: <https://github.com/doloreshaze337/taggui>  
- image-caption-webui: <https://github.com/NeuroSenko/image-caption-webui>  

### Обучение
!!! info "Информация о требуемых git-ветках актуальна на состояние 02.09.2024"

#### kohya sd-scripts
<https://github.com/kohya-ss/sd-scripts/tree/sd3?tab=readme-ov-file#flux1-training-wip>

Нужно переключиться на ветку `sd3`.
#### LoRA_Easy_Training_Scripts
<https://github.com/derrian-distro/LoRA_Easy_Training_Scripts/tree/flux>

Нужно переключиться на ветку `flux`. Готовый конфиг можно [скачать здесь](https://files.catbox.moe/du67iy.toml).

#### SimpleTuner
<https://github.com/bghira/SimpleTuner>

Поддержка flux доступна в основной ветке. Также в репозитории есть [инструкция по обучению](https://github.com/bghira/SimpleTuner/blob/main/documentation/quickstart/FLUX.md).
## Особенности лицензирования
Модели **dev** и **schnell** распространяются под разными лицензиями:  

- **schnell** распространяется под лицензией Apache 2, что позволяет использовать модель и её производные без ограничений  
- **dev** распространяется под [Non-Commercial Use Only лицензией](https://huggingface.co/black-forest-labs/FLUX.1-dev/blob/main/LICENSE.md), что будет требовать выплат роялти и прочих комиссий в случае, если кто-то захочет коммерциализировать использование модели dev или её производных  

!!! quote "Ключевой пункт лицензии **FLUX.1 [dev]**"
    Non-Commercial Use Only. You may only access, use, Distribute, or creative Derivatives of or the FLUX.1 [dev] Model or Derivatives for Non-Commercial Purposes.

    If You want to use a FLUX.1 [dev] Model a Derivative for any purpose that is not expressly authorized under this License, such as for a commercial activity, you must request a license from Company, which Company may grant to you in Company’s sole discretion and which additional use may be subject to a fee, royalty or other revenue share.

    Please contact Company at the following e-mail address if you want to discuss such a license: [info@blackforestlabs.ai](mailto:info@blackforestlabs.ai).