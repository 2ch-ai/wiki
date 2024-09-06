# FLUX

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

Модель **pro** доступна только в онлайне по подписочной системе.

**Dev** является дистилированной версией от pro модели и не имеет полноценного unconditional guidance, вследствии чего эту модель из коробки юзать с негативами не получится, но есть хак, с помощью [этого экстеншена](https://github.com/mcmonkeyprojects/sd-dynamic-thresholding), подробнее про это вкратце с примерным воркфлоу для comfyui [здесь](https://old.reddit.com/r/StableDiffusion/comments/1ekgiw6/heres_a_hack_to_make_flux_better_at_prompt/). Сам же гайданс этой версии модели отличается от обычного CFG, он является distilled гайдансом, имеет свою ноду в комфи и соответствующую настройку в фордже.

Особенностью модели **schnell** является сходимость за низкое число шагов семплинга, что позволяет генерировать изображения быстро, но в ущерб качеству. Согласно офф. документации необходимо всего 1-4 шага.

## Системные требования

Комфортный минимум для запуска - карта NVidia с ~~16~~ 12 GB VRAM в GGUF кванте и выгрузкой T5 на CPU/квантованием Т5. Более подробно про кванты [тут](https://github.com/lllyasviel/stable-diffusion-webui-forge/discussions/981) и [тут](https://github.com/lllyasviel/stable-diffusion-webui-forge/discussions/1050). Плюсом будет общее понимание про GGUF кванты жоры из мира ллм, вкратце юнеты в ггуф формате лежат на [хаггингфейсе](https://huggingface.co/lllyasviel/FLUX.1-dev-gguf/tree/main), Q5 по качеству не должно уступать fp8, Q8 bf16, на деле же [в примерах](https://www.reddit.com/r/StableDiffusion/comments/1eso216/comparison_all_quants_we_have_so_far/) мику перестала быть чернокожей после квантования в 5 бит. T5 квантовать тоже можно, [репа с квантами](https://huggingface.co/city96/t5-v1_1-xxl-encoder-gguf/tree/main) сравнение квантов [тут](old.reddit.com/r/LocalLLaMA/comments/1anb2fz/guide_to_choosing_quants_and_engines/). По скорости быстрее всего на момент обновления статьи 04.09.2024 работает comfyui с флагом запуска --fast в fp8_e4m3 точности с 4000+ поколением видеокарт, более младшие амперы(3000) не имеют аппаратного ускорения fp8 вычислений и буст, увы, никогда не получат.

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
Лоры для Flux можно обучать на потребительском железе с 12-24 GB VRAM, в зависимости от параметров обучения. Стоит упомянуть, что тренировать в полной точности с 24гб картой флюкс просто невозможно, буквально все лоры которые тренировались на таких картах будут натренены либо с квантованного чекпоинта, либо в фп8 в случае с кохьей. Если лора тренилась с помощью кохьи или аи-тулкита, то лучше всего она будет работать естественно [с фп8 точностью юнета во врема инференса](https://old.reddit.com/r/StableDiffusion/comments/1eumy5n/another_flux1dev_quantisation_comparison_but_with/), ну и несколько лор тоже будут лучше работать соответственно. Буквально недавно появилась поддержка тренировки мелкого clip_l клипа. ~~[T5 для тренировки пока недоступен](https://github.com/huggingface/diffusers/blob/main/examples/dreambooth/README_flux.md#text-encoder-training)~~, не актуально, 04.09.2024 в sd-scripts появилась возможность тренировки T5 лорой, чекаем [ридми](https://github.com/kohya-ss/sd-scripts/blob/sd3/README.md).

### Генерация описаний
Поскольку базовая модель не была обучена на booru-тегах, имеет смысл делать описания изображений для тренировки лор натуртекстом.

Описания можно сгенерировать через VLM, например при помощи InternVL2[ 26В](https://huggingface.co/OpenGVLab/InternVL2-26B)/[40В](https://huggingface.co/OpenGVLab/InternVL2-40B) или с помощью более легковестного [Idefics3-8B-Llama3](https://huggingface.co/HuggingFaceM4/Idefics3-8B-Llama3).

Адекватных опенсорс кэпшеонеров нсфв контента с натуральным языком, обрабатывающих каждую картинку разумное количество времени, в данный момент просто нет.
Немного общей теории, для понимания происходящего процесса можно вкратце впитать [тут](https://old.reddit.com/r/LocalLLaMA/comments/1f7cdhj/koboldcpp_and_vision_models_a_guide/).

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
Активное обсуждение ведётся [тут](https://github.com/kohya-ss/sd-scripts/pull/1374). [Ридми](https://github.com/kohya-ss/sd-scripts/blob/sd3/README.md), как и скрипты обновляется очень часто, завозятся новые фичи. Пока есть определённые баги с мульти-разрешением и шифтом таймстепов, кохья кстати рекомендует тренировать сильнее на ранних таймстепах.

Нужно переключиться на ветку `sd3`.
#### LoRA_Easy_Training_Scripts
<https://github.com/derrian-distro/LoRA_Easy_Training_Scripts/tree/flux>

Нужно переключиться на ветку `flux`. Готовый конфиг можно [скачать здесь](https://files.catbox.moe/du67iy.toml).

#### SimpleTuner - linux only
<https://github.com/bghira/SimpleTuner>

Поддержка flux доступна в основной ветке. Также в репозитории есть [инструкция по обучению](https://github.com/bghira/SimpleTuner/blob/main/documentation/quickstart/FLUX.md).
Умеет тренить в квантах int8, int4, int2. [INT4 не заведётся](https://github.com/bghira/SimpleTuner/issues/804#issuecomment-2295370317), если нету A100 или H100.
## Особенности лицензирования
Модели **dev** и **schnell** распространяются под разными лицензиями:  

- **schnell** распространяется под лицензией Apache 2, что позволяет использовать модель и её производные без ограничений  
- **dev** распространяется под [Non-Commercial Use Only лицензией](https://huggingface.co/black-forest-labs/FLUX.1-dev/blob/main/LICENSE.md), что будет требовать выплат роялти и прочих комиссий в случае, если кто-то захочет коммерциализировать использование модели dev или её производных  

!!! quote "Ключевой пункт лицензии **FLUX.1 [dev]**"
    Non-Commercial Use Only. You may only access, use, Distribute, or creative Derivatives of or the FLUX.1 [dev] Model or Derivatives for Non-Commercial Purposes.

    If You want to use a FLUX.1 [dev] Model a Derivative for any purpose that is not expressly authorized under this License, such as for a commercial activity, you must request a license from Company, which Company may grant to you in Company’s sole discretion and which additional use may be subject to a fee, royalty or other revenue share.

    Please contact Company at the following e-mail address if you want to discuss such a license: [info@blackforestlabs.ai](mailto:info@blackforestlabs.ai).