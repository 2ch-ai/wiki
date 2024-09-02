!!! quote "История о том, как меня перестали пугать фурри-модели и я начал генерировать на них аниме"

[[Подробная информация на английском]](https://rentry.org/5exa3)

EasyFluff представляет собой файнтьюн Stable Diffusion 1.5, специализацией которого является генерация фуррей.

Позднее аноном в форча был обучен крупный ликорис (800Мб при весе модели в 2Гб), благодаря которому стало возможным генерировать обычных аниме-тяночек на данном чекпоинте.

## Особенности связки EasyFluff + hll
- Высокое базовое разрешения (вплоть до 1088 пикселей) без потери когерентности
- Наилучшее понимание NSFW-концептов среди всех SD1 чекпоинтов
- Знание огромного количества [аниме-художников](https://files.catbox.moe/c1jlaq.txt) из коробки
- Понимание тегов в стиле danbooru и e621
- Совместимость с лорами для NAI

## Как установить
1. Скачать [EasyFluff](https://huggingface.co/zatochu/EasyFluff/resolve/main/EasyFluffV11.2.safetensors)
2. Скачать [yaml-конфиг](https://huggingface.co/zatochu/EasyFluff/raw/main/EasyFluffV11.2.yaml) и разместить его в директории с моделью
3. Скачать [hll-ликорис](https://huggingface.co/CluelessC/hll-test/blob/main/lyco/hll6.3-fluff-a9.safetensors) и использовать его в паре с моделью

[Картинка с PNG-Info](https://files.catbox.moe/t11uwi.png) для примера.

## Готовые мёрджи

### Based
[[Based 69]](https://civitai.com/models/299275/based69) [[Based 68]](https://civitai.com/models/236447/based68)

Очевидная идея — почему-бы просто не смёрджить EasyFluff + hll и использовать данный мёрдж как самостоятельный чекпоинт?

Именно такой подход реализован в семействе **Based** моделей, начиная с 68 версии.

### LS_Kerberos
[[Huggingface]](https://huggingface.co/latent-space-dreams/LS_Kerberos/blob/main/LS_Kerberos_v1_1.safetensors)

Другой чекпоинт на аналогичной связке, но ещё дополнительно подмёрджен [LS Vividus](https://civitai.com/models/85283/ls-vividus).
