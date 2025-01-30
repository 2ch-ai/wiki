---
title: Облачная генерация
---

# Облачная генерация

## Сервисы онлайн-генераций
* <https://civitai.com>
* <https://tensor.art>
* <https://seaart.ai>
* <https://pixai.art>
* <https://fluxpro.art>

На бесплатных аккаунтах есть лимиты по числу генераций. Лимиты могут абузиться посредством создания нескольких аккаунтов или совершения различных действий для заработка местной валюты.

??? info "За что дают валюту на civitai.com"
    ![](https://files.catbox.moe/1y45t0.png)

На [civitai.com](https://civitai.com) присутствует цензура, блокирующая определённые запросы. Со списом запрещённых на CivitAI слов можешь ознакомиться [здесь](https://github.com/civitai/civitai/blob/main/src/utils/metadata/lists/blocklist.json) и [здесь](https://github.com/civitai/civitai/blob/main/src/utils/metadata/lists/blocklist-nsfw.json).

## Google Colab
[Официальный блокнот для Foocus](https://colab.research.google.com/github/lllyasviel/Fooocus/blob/main/fooocus_colab.ipynb)

Google Colab - это бесплатная (с лимитами) облачная среда, которая позволяет запускать код Python на серверах гугла. Изначально предназначался для проектов машинного обучения, но, из-за всплеска интереса к Stable Diffusion, стал активно использоваться для генерации картинок.

Виртуальная машина предоставляется на несколько часов в сутки. Ограничения обходятся посредством создания нескольких аккаунтов.

Из-за слишком большой нагрузки со стороны желающих генерировать картинки, Google сперва запретил запуск AUTOMATIC1111 в коллабе, а, затем, и запуск любых скриптов, связанных с генераций картинок в Stable Diffusion.

Однако, коллаб по своей природе предоставляет пользователю виртуальную машину, с которой он волен делать всё что угодно. По этой причине, осуществить такой запрет очень сложно. Какое-то время работала простая замена всех переменных, связанных напрямую со Stable Diffusion (stable-diffusion-webui, sd-webui и т.п.), сейчас фильтры закрутили сильнее и информации о рабочих блокнотах для Stable Diffusion очень мало.

~~Злые языки говорят, что всё ещё существуют рабочие коллабы для AUTOMATIC1111, но никто не спешит делиться сведениями, поскольку боятся дальнейших блокировок.~~

Гугл вроде перестал страдать шизой и банить блокноты с диффузионными моделями. По крайней мере, данный анон на момент правок без проблем запустил А1111 на инстансе Т4 и за три часа работы никаких последствий от гугла не было.

Колаб с [ComfyUI + ComfyManager](https://colab.research.google.com/github/ltdrdata/ComfyUI-Manager/blob/main/notebooks/comfyui_colab_with_manager.ipynb).

Колаб с [A1111](https://colab.research.google.com/github/TheLastBen/fast-stable-diffusion/blob/main/fast_stable_diffusion_AUTOMATIC1111.ipynb#scrollTo=PjzwxTkPSPHf).

## Hugging Face
* [Официальный спейс для запуска FLUX.1-schnell](https://huggingface.co/spaces/black-forest-labs/FLUX.1-schnell)
* [Официальный спейс для запуска FLUX.1-dev](https://huggingface.co/spaces/black-forest-labs/FLUX.1-dev)
