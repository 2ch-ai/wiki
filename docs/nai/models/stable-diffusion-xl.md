# Stable Diffusion XL

!!! info "Pony Diffusion v6 XL"
    PonyDiffusion имеет несколько своих нюансов, ему посвящена [отдельная статья](./pony-diffusion-v6-xl.md) в вики.

Stable Diffusion XL является базовой моделью выпущенной Stability AI летом 2023 года.

## Отличия от SD 1.5:

- Использует сразу два текстовых энкодера - [OpenCLIP-ViT/G](https://github.com/mlfoundations/open_clip) и [CLIP-ViT/L](https://github.com/openai/CLIP/tree/main)
- Тренировка осуществлялась на изображениях с разным соотношением сторон, в то время как прошлые версии обучались только на квадратных изображениях
- Вместе с базовой моделью был анонсирован так называемый **Refiner**.  
  Это дополнительная модель, которая должна была использоваться в паре с основной SDXL-моделью, чтобы улучшать детализацию в генерируемых изображениях. По итогу подход с Refiner'ом не получил широкого распространения и базовая модель, как правило, используется самостоятельно 

![](https://huggingface.co/stabilityai/stable-diffusion-xl-base-1.0/resolve/main/pipeline.png)

## Основанные на SDXL модели
- [Animagine](https://civitai.com/models/260267/animagine-xl-v3)
- [Pony Diffusion v6 XL](https://civitai.com/models/257749/pony-diffusion-v6-xl) ([статья на вики](./pony-diffusion-v6-xl.md))
- [Прочие модели](https://civitai.com/search/models?baseModel=SDXL%201.0&modelType=Checkpoint&tags=anime&sortBy=models_v9)

## Где взять лоры
- [Лоры на civitai](https://civitai.com/search/models?baseModel=SDXL%201.0&modelType=LORA&tags=anime&sortBy=models_v9)

## ControlNet-модели
- [Anytest v1](https://huggingface.co/2vXpSwA7/iroiro-lora/tree/main/test_controlnet)
- [Anytest v2](https://huggingface.co/2vXpSwA7/iroiro-lora/tree/main/test_controlnet2)
- [Mistoline](https://civitai.com/models/441432/mistoline)
- [kataragi](https://huggingface.co/kataragi)
