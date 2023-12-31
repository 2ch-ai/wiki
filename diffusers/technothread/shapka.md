## Шапка технотреда

Тег: tech \
Тема: Stable Diffusion технотред `#xxxx`

***

(4 стула) | (выебоны) | (оверфит) | (число итераций для GPU)
------ | ------ | ------ | ------
![](https://i.imgur.com/oYvIzol.png)  | ![](https://i.imgur.com/7zWzj10.png) | ![](https://i.imgur.com/Wo0tLKc.png) | ![](https://i.imgur.com/rL0w8ih.png)

***

[I]*ИТТ делимся советами, лайфхаками, наблюдениями, результатами обучения, обсуждаем внутреннее устройство диффузионных моделей, собираем датасеты, решаем проблемы и экспериментируем*[/I]
[I]*Тред общенаправленныей, тренировка дедов, лупоглазых и фуррей приветствуются*[/I]

Предыдущий тред: `>>#############`

[B]**➤ Софт для обучения**[/B]

https://github.com/kohya-ss/sd-scripts \
Набор скриптов для тренировки, используется под капотом в большей части готовых GUI и прочих скриптах.
Для удобства запуска можно использовать дополнительные скрипты в целях передачи параметров, например: https://rentry.org/simple_kohya_ss

[B]**➤ GUI-обёртки для sd-scripts**[/B]

https://github.com/bmaltais/kohya_ss \
https://github.com/derrian-distro/LoRA_Easy_Training_Scripts \
https://github.com/anon-1337/LoRA-train-GUI

[B]**➤ Обучение SDXL**[/B]

https://github.com/2ch-ai/wiki/blob/main/diffusers/technothread/sdxl.md

[B]**➤ Гайды по обучению**[/B]

Существующую модель можно обучить симулировать определенный стиль или рисовать конкретного персонажа.

✱ [I]*LoRA*[/I] – "Low Rank Adaptation" – подойдет для любых задач. Отличается малыми требованиями к VRAM (6 Гб+) и быстрым обучением. https://github.com/cloneofsimo/lora - изначальная имплементация алгоритма, пришедшая из мира архитектуры transformers, тренирует лишь attention слои, гайды по тренировкам: \
https://github.com/2ch-ai/wiki/blob/main/diffusers/2chAI_easy_LORA_guide.md - гайд по подготовке датасета и обучению LoRA для неофитов \
https://rentry.org/2chAI_hard_LoRA_guide - ещё один гайд по использованию и обучению LoRA \
https://rentry.org/59xed3 - более углубленный гайд по лорам, содержит много инфы для уже разбирающихся (англ.)

✱ [I]*LyCORIS*[/I] (Lora beYond Conventional methods, Other Rank adaptation Implementations for Stable diffusion) - проект по созданию алгоритмов для обучения дополнительных частей модели. Ранее имел название LoCon и предлагал лишь тренировку дополнительных conv слоёв. В настоящий момент включает в себя алгоритмы LoCon, LoHa, LoKr, DyLoRA, IA3, а так же на последних dev ветках возможность тренировки всех (или не всех, в зависимости от конфига) частей сети на выбранном ранге: \
https://github.com/KohakuBlueleaf/LyCORIS

Подробнее про алгоритмы в вики https://github.com/2ch-ai/wiki/blob/main/diffusers/technothread/lycoris.md

✱ [I]*Dreambooth*[/I] – выбор 24 Гб VRAM-бояр. Выдаёт отличные результаты. Генерирует полноразмерные модели: \
https://rentry.co/lycoris-and-lora-from-dreambooth (англ.) \
https://github.com/nitrosocke/dreambooth-training-guide (англ.)

✱ [I]*Текстуальная инверсия (Textual inversion)*[/I], или же просто Embedding, может подойти, если сеть уже умеет рисовать что-то похожее, этот способ тренирует лишь текстовый энкодер модели, не затрагивая UNet: \
https://rentry.org/textard (англ.)

**➤ Тренировка YOLO-моделей для ADetailer:** \
YOLO-модели (You Only Look Once) могут быть обучены для поиска определённых объектов на изображении. В паре с ADetailer они могут быть использованы для автоматического инпеинта по найденной области.

Подробнее в вики: https://github.com/2ch-ai/wiki/blob/main/diffusers/technothread/yolo.md

[I]*Не забываем про золотое правило GIGO ("Garbage in, garbage out"): какой датасет, такой и результат.*[/I]

[B]**➤ Гугл колабы**[/B]

﹡Текстуальная инверсия: https://colab.research.google.com/github/huggingface/notebooks/blob/main/diffusers/sd_textual_inversion_training.ipynb \
﹡Dreambooth: https://colab.research.google.com/github/TheLastBen/fast-stable-diffusion/blob/main/fast-DreamBooth.ipynb \
﹡LoRA \[1] https://colab.research.google.com/github/Linaqruf/kohya-trainer/blob/main/kohya-trainer.ipynb \
﹡LoRA \[2] https://colab.research.google.com/drive/1bFX0pZczeApeFadrz1AdOb5TDdet2U0Z

[B]**➤ Полезное**[/B]

Расширение для фикса CLIP модели, изменения её точности в один клик и более продвинутых вещей, по типу замены клипа на кастомный: https://github.com/arenasys/stable-diffusion-webui-model-toolkit \
Гайд по блок мерджингу: https://rentry.org/BlockMergeExplained (англ.) \
Гайд по ControlNet: https://stable-diffusion-art.com/controlnet (англ.)

Подборка мокрописек для датасетов от анона: https://rentry.org/te3oh \
Группы тегов для бур: https://danbooru.donmai.us/wiki_pages/tag_groups (англ.)

Гайды по апскейлу от анонов: \
https://rentry.org/SD_upscale \
https://rentry.org/sd__upscale \
https://rentry.org/2ch_nai_guide#апскейл \
https://rentry.org/UpscaleByControl

Коллекция лор от анонов: https://rentry.org/2chAI_LoRA

Гайды, эмбеды, хайпернетворки, лоры с форча: \
https://rentry.org/sdgoldmine \
https://rentry.org/sdg-link \
https://rentry.org/hdgfaq \
https://rentry.org/hdglorarepo \
https://gitgud.io/gayshit/makesomefuckingporn

[B]**➤ Legacy ссылки на устаревшие технологии и гайды с дополнительной информацией**[/B]

https://github.com/2ch-ai/wiki/blob/main/diffusers/technothread/legacy.md

[B]**➤ Прошлые треды**[/B]

https://github.com/2ch-ai/wiki/blob/main/diffusers/technothread/old_threads.md


Шапка: https://github.com/2ch-ai/wiki/blob/main/diffusers/technothread/shapka.md
