# RVC
[[Github]](https://github.com/RVC-Project/Retrieval-based-Voice-Conversion-WebUI)

RVC представляет из себя программное обеспечения для преобразования одного голоса в другой. Вы можете обучать собственные модели, основываясь на нескольких минутах записи нужного вам голоса - разные гайды советуют использовать датасеты от 5 до 30 минут.

Так же в комплекте идут утилиты для изменения голоса в реальном времени.

## Как использовать?
* [Гайд от анона](./rvc-usage.md)
* [Более подробный гайд по установке и обучению своих моделей на Mangiro-RVC](https://github.com/MaHivka/ultimate-voice-models-FAQ/wiki/RVC)
* [Как подготовить свой датасет (англ)](https://docs.aihub.wtf/guide-to-create-a-model/dataset-creation)
* [Как обучать свои модели (англ)](https://docs.aihub.wtf/guide-to-create-a-model/model-training-rvc)
* [Определение оптимальной эпохи через TensorBoard (англ)](https://docs.aihub.wtf/guide-to-create-a-model/tensorboard-rvc)

## Где взять и как установить готовые модели?
Онлайн-каталоги моделей:  

* [https://discord.gg/aihub](https://discord.gg/aihub) (канал voice-models)  
* [https://www.weights.gg](https://www.weights.gg)    
* [https://voice-models.com](https://voice-models.com)  
* [https://huggingface.co](https://huggingface.co) (ищите по имени спикера + rvc, * например "letov rvc")  
* [https://google.com](https://google.com) (аналогично предыдущему пункту)  
* [https://t.me/AINetSD_bot](https://t.me/AINetSD_bot)  

Модели состоят либо из одного файла `pth`, либо из двух файлов - `pth` и `index`.

Помещать модели необходимо сюда:  
- файлы `.pth` в директорию `/weights`  
- файлы `.index` в директорию `/logs`  

## Альтернативные UI
**TODO**

## Прочее

### self-destruction/AiAutoCover
[[Github]](https://github.com/self-destruction/AiAutoCover) | [[Google Colab]](https://colab.research.google.com/github/self-destruction/AiAutoCover/blob/main/AI_Auto_Cover_V1.ipynb)

Данный блокнот позволяет заменить голос в песне всего в несколько кликов.

Вам понадобятся ссылка на YouTube и ссылка на модель вокала. Всё, нейро-кавер готов! Не нужно ничего устанавливать. Все вычисления происходят на серверах гугл (около 2 часов в день - бесплатно).