# Обучение SDXL

Если вы используете скрипты [https://github.com/kohya-ss/sd-scripts](https://github.com/kohya-ss/sd-scripts) напрямую, то, для обучения SDXL, вам необходимо переключиться на ветку "sdxl" и обновить зависимости. Эта операция может привести к проблемам совместимости, так что, желательно, делать отдельную установку для обучения SDXL и использовать отдельную venv-среду. Скрипты для тренировки SDXL имеют в имени файла префикс sdxl_.

Подробнее про обучение SDXL через kohya-ss можно почитать тут: [https://github.com/kohya-ss/sd-scripts/tree/sdxl#about-sdxl-training](https://github.com/kohya-ss/sd-scripts/tree/sdxl#about-sdxl-training)

Для GUI [https://github.com/bmaltais/kohya_ss](https://github.com/bmaltais/kohya_ss) и [https://github.com/derrian-distro/](https://github.com/derrian-distro/LoRA_Easy_Training_Scripts/tree/SDXL) так же вышли обновления, позволяющее делать файнтьюны для SDXL. Кроме полноценного файнтьюна и обучения лор, для bmaltais/kohya_ss так же доступны пресеты для обучения LoRA/LoHa/LoKr, в том числе и для SDXL, требующие больше VRAM.

# Требования по VRAM для тренировки SDXL
!!!info "TL;DR"
    Обучение полновесных SDXL-чекпоинтов через будку недоступно для обывателя.

    Тренировать лоры можно и на 8 гигах. Качественный результат и адекватная скорость в сделку не входят.

Приведённые ниже тесты [актуальны на 09.02.2024](https://2ch.hk/ai/res/570475.html#638546), тестировалось на kohya-ss/sd-scripts версии 0.8.3.

Тренировка ниже 20 гигов достигается за счет градиент-чекпоинтинга, ниже 12 - треш типа загрузки базовой модели в 8 битах. Насколько сильно всрет - неизвестно.

Gradient checkpointing позволяет легко бустануть батчсайз без сильного роста жора памяти и необходимости в аккумуляции, но снижает скорость тренировки.

!!!warning
    Все значения - только потребление питона, если делается на винде с ускоряемым браузером, ютубчиком, парой мониторов и т.д. - можно гиг-два еще накидывать.

|Тип обучения|batch size = 1|batch size = 2|batch size = 3|batch size = 4|batch size = 8|
|-|-|-|-|-|-|
|**Dreambooth**|38.5|44.0|-|-|-|
|**Dreambooth, gradient checkpointing**|34.4|35.2|-|-|40.5|
|**LoRA dim=32**|17.4|-|-|47.7|-|
|**LoRA dim=32, full bf16**|16.7|-|-|-|-|
|**LoRA dim=32, gradient checkpointing**|9.4|13.1|-|-|-|
|**LoRA dim=32, full bf16, gradient checkpointing**|9.1|-|-|-|-|
|**LoRA dim=32, fp8base, gradient checkpointing**|6.4|-|-|-|-|
|**LoRA dim=128**|20.5|-|41.7|-|-|
|**LoRA dim=128, full bf16**|18.3|-|-|47.8|-|
|**LoRA dim=128, gradient checkpointing**|12|-|-|-|-|
|**LoRA dim=128, full bf16, gradient checkpointing**|10.3|-|-|15.0|-|
|**LoRA dim=128, fp8base, gradient checkpointing**|9.9|-|-|-|-|
|**LoCon dim=64+32**|18.6|30.4|-|-|-|
|**LoCon dim=64+32, gradient checkpointing**|10.6|-|-|-|-|
|**LoCon dim=64+32, full bf16, gradient checkpointing**|9.7|-|-|-|-|
|**LoCon dim=64+32, fp8base, gradient checkpointing**|7.2|-|-|-|-|
