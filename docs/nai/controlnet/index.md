---
title: ControlNet
---

# ControlNet

**ControlNet** - это нейросетевая архитектура, которая позволяет добавлять пространственные управляющие элементы в большие, предварительно обученные модели для генерации изображений.

ControlNet использует уже обученные слои больших нейронных сетей, и добавляет к ним новые слои, которые учатся понимать и использовать дополнительные условия.

Проще говоря: ControlNet - это способ "управлять" процессом генерации изображения с помощью дополнительных нейросетей. Вы можете задавать дополнительные условия, например, контуры, глубину или позу человека, чтобы получить более точный и желаемый результат.

### Гайды по использованию ControlNet
* [Апскейл с помощью ControlNet в AUTOMATIC1111 webui](https://rentry.co/UpscaleByControl)
* [ControlNet: A Complete Guide (english)](https://stable-diffusion-art.com/controlnet/)
* [ControlNet: A Complete Guide (перевод)](./controlnet-complete-guide.md)
* [ControlNet: Управляй позами в Stable Diffusion](https://www.itshneg.com/controlnet-upravlyaj-pozami-v-stable-diffusion)

### ControlNet модели

#### Stable Diffusion XL
* [Anytest 1](https://huggingface.co/2vXpSwA7/iroiro-lora/tree/main/test_controlnet)
* [Anytest 2](https://huggingface.co/2vXpSwA7/iroiro-lora/tree/main/test_controlnet2)
* [MistoLine](https://civitai.com/models/441432/mistoline)
* [Union SDXL 1.0](https://huggingface.co/xinsir/controlnet-union-sdxl-1.0)
* [kataragi](https://huggingface.co/kataragi)

С [PonyDiffusion v6 XL](../models/pony-diffusion-v6-xl.md) совместимы следующие модели:

* Anytest, отмеченные символами `p` (cnlllite-anytest_**P**...) и `pn` (CN-anytest_v3-..._**pn**_...).
* Union SDXL 1.0

Совместимые с Animagine модели из коллекции Anytest отмечены символами `a` и `an`.

#### Stable Diffusion 1
* [ControlNet 1.1](https://civitai.com/models/38784)
* [QR Code Monster](https://huggingface.co/monster-labs/control_v1p_sd15_qrcode_monster)
