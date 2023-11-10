![Head](https://files.catbox.moe/8tq1hn.jpg)
#2ch /NAI/ Guide
Ну что же, мой дорогой друг, ты захотел генерировать аниме-тяночек, но столкнулся с дефицитом нормальных гайдов, или стенами текста на ангельском, в которых прежде всего рассказывается как запустить на CPU или AMD? Сегодня мы разберем как установить и подготовить в работе самый популярный и функциональный на данный момент интерфейс, рассмотрим некоторые примеры генераций и даже порассуждаем о том как получить хороший результат.

[TOC]

***
#Установка
## Что потребуется
**Рекомендуемые требования:** 16+гб рам, видеокарта 2к серии и быстрый ссд с достаточным объемом свободного места, актуальная windows
**Минимальные требования:** видеокарта Nvidia с памятью 4гб, актуальная windows
В теории заставить работать можно практически на любом железе, но это все будет связано или с низкой производительностью (GTX1000 и ранее), дополнительно к этому необходимость неоптимальных параметров запуска (GTX1600), или бонусом еще знатный пердолинг и частично недоступный функционал (AMD). Генерацию на процессоре и младших карточках амд не стоит даже рассматривать. Также в пролете и ретрограды с семерками и всратосборками, зато на линуксах все должно работать as is.
!!!danger **Гайд рассчитан прежде всего на актуальное железо**
	Если на твоей некропечке что-то не работает, или ты наоборот знаешь необходимый нюанс для запуска на ней – не стесняйся и отписывай в тред
	
	Не менее важный момент - воспроизведение сидов (повторение чужих генераций). При использовании параметров запуска, меняющих точность вычислений, оптимизирующих скорость на определенном железе и ==medvram==, ==lowvram== для запуска на карточках с малым объемом видеопамяти, результаты генераций могут оказаться другими
##Скачивание
Прежде всего идем на сайт новидео, скачиваем и ставим последнюю версию драйвера. Далее, ребутаемся при необходимости и идем скачивать python https://www.python.org/downloads/release/python-3109/
!!!note Не забываем при установке выбрать галочки
-> ![Path](https://imgur.com/lXEmhpJ.png) <-
- Идем на https://git-scm.com/download/win и скачиваем установщик 64-битной версии, устанавливаем с параметрами по дефолту
- Выбираем место на диске, быстрый ссд крайне желателен, жмем правой кнопкой по пустому месту и выбираем “Git Bash Here”
!!!info Путь до папки не должен содержать кирилицы или пробелов
	например "d:/ai/" - подойдет, "c:/users/Вася/Рабочий стол/" - приведет к ошибкам
- В появившийся терминал вставляем

```git clone https://github.com/AUTOMATIC1111/stable-diffusion-webui.git```
- Скачиваем модель https://civitai.com/models/9409?modelVersionId=30163
- Копируем файл в папку `./models/Stable-diffusion`
- Скачиваем VAE https://civitai.com/models/22354?modelVersionId=29968
- Копируем файл в папку `./models/VAE`

Теперь идем в корень webui, ищем файл webui-user.bat и 6-ю строку в нем заменяем на `set COMMANDLINE_ARGS= --xformers --no-half-vae` 
-> ![webui-user.bat](https://imgur.com/FREKrTE.png) <-
- Запускаем и пользуемся именно им в дальнейшем.

Первый запуск займет продолжительное время, поскольку будут скачиваться и устанавливаться все необходимые пакеты

-> ![Imgur](https://imgur.com/WioKrsm.png)<-

просто ждем, пока не появится строка

-> ![Imgur](https://imgur.com/ZT9WfR1.png)<-

- Далее, закрываем окно и заново запускаем вышеописанный батник.

!!!info Делать перезапуск рекомендуется
	также и после каждого обновления аддонов, большинству из них простого перезапуска UI недостаточно, а также в любой непонятной ситуации
Если все прошло по плану, то увидим то же самое, но сразу, переходим по ссылке http://127.0.0.1:7860 из терминала (клик с нажатым ctrl).
Мотаем в самый раз страницы и сверяем то, что там написано с
->![Imgur](https://imgur.com/XsKpqo7.png)<-
Если версии совпадают или более новые **и нигде нет N/A** то все в порядке. Сразу идем на вкладку ==**Settings**==, жмем ==**Show all pages**==, и ищем на странице
- `Clip skip` – двигаем крутилку до значения `2` или выставляем в поле ввода
- `Eta noise seed delta` – вводим `31337`
- `SD VAE` – выбираем скачанное `clearvae_nanlesstest.safetensor`
- `Quicksettings list` - `sd_model_checkpoint, sd_vae, CLIP_stop_at_last_layers`

Возвращаемся в самый верх и жмем сначала большую кнопку ==**Apply settings**== и далее справа от нее ==**Reload UI**==

##Тестовая генерация
***
Итак, проверив что сверху выбрана скачанная нами модель, VAE а Clip skip не убежал с 2, на вкладке txt2img выставляем следующие параметры

->![Imgur](https://imgur.com/d0IPGjD.png)<-

В верхнее поле (Prompt) вставляем:
```1girl, fox ears, animal ear fluff, fox tail, black hair, blue eyes, glasses, sweater, jeans, narrow waist, cowboy shot, smile, outdoors, pretty face, detailed background, masterpiece, best quality, ultra-detailed, illustration, epic lighting ```
В то что под ним (Negative prompt):
```(worst quality, low quality:1.3), simple background```
В Sampling method выбираем `DPM++ 2M Karras`, `Sampling steps` ставим `24`, в поле `Seed` вставляем: `3287962209`, нажимаем кнопку ==**Generate**==

Если все сделано верно, то получится лиса пикрелейтед.

->[![Imgur](https://imgur.com/KAKRmBD.png)](https://imgur.com/KAKRmBD.png)<-

!!!info Результат незначительно отличается
	При использовании xformets закладываемая оптимизация позволяет повысить скорость и снизить расход памяти, но результат становится недетерменированным. Пугаться не нужно, пиксельперфект копии не будет, но в 98% случаев отличия заметить можно только вычитая разницу слоев
!!!Warning У меня другая генерация
	Для начала проверь что не забыл установить все настройки, указал все параметры в полях и используешь указанные модели. Убедись что в поле seed нет пробелов перед или после номера.
!!!danger
	Если же ты используешь слабую гпу или вообще AMD и запускаешь с **medvram/lowvram**, то велик шанс картинки будут другими, а с апскейлом разница будет расти. Другие результаты можно считать нормой, кроме отличий в сидах о прямом падении качества не сообщалось.

Для того чтобы сделать ее, и другие генерируемые пикчи менее шакальными, нажимаем галочку `Hires. Fix`. Среди появившихся новых параметров `Upscaler` ставим `Latent`, `Denoising strength` убавляем до `0.6`, все остальное оставляем по дефолту.

->![Imgur](https://imgur.com/3SaJxeJ.png)<-

Референс результат:

->[![Imgur](https://imgur.com/Gx8CFeR.png)](https://imgur.com/Gx8CFeR.png)<-

Вот так уже лучше, однако, можно заметить, что результат сильно отличается от исходной генерации. Все дело в **Latent апскейлере**, который агрессивно добавляет много деталей, где-то это может значительно повысить качество, где-то наоборот сломать.
!!!warning При использовании **Latent** апскейлеров не стоит снижать `Denoising strength` ниже значения `0.6`
	это может привести к сильно размытому изображению и появлению прямоугольных артефактов
В качестве альтернативы ему можно использовать GAN – апскейлеры. Они требуют меньший денойз, но конкретная величина будет завесить от используемого.
Среди списка под Upscaler выбираем R-ESRGAN 4x+ Anime6B, Denoising strength снижаем до 0.5, запускаем генерацию.

->![Imgur](https://imgur.com/NveENzC.png)<-

Референс результат:

->[![Imgur](https://imgur.com/nJ1nmVs.png)](https://imgur.com/nJ1nmVs.png)<-

Для данного промта и модели такой вариант ган-апскейлера дают результат хуже латента, однако часто можно встретить обратный эффект. Что важно - изображение совпадает с исходным.
***
Моделей (чекпоинтов) существует множество, они сильно отличаются друг от друга, скачать их можно civitai, а краткий обзор посмотреть 
[Здесь](https://rentry.org/nai_models).

VAE также существует несколько вариантов, предложенное в начале достаточно универсально и совместимо с большинством моделей, но дает менее насыщенные цвета и требует -no-half-vae для корректной работы, что несколько снижает производительность. Альтернативой ему могут быть [84k](https://huggingface.co/stabilityai/sd-vae-ft-mse-original/blob/main/vae-ft-mse-840000-ema-pruned.ckpt) и [kl-f8](https://huggingface.co/hakurei/waifu-diffusion-v1-4/blob/main/vae/kl-f8-anime2.ckpt), они дают отличный черный, правильный цветовой баланс и не приводят к черным квадратам / вылетам по NaN. Но, увы могут неверно работать с некоторыми моделями (например, Counterfeit2.5, AOM3A2 и т.д.).

##Еще референс генерации

->[![Imgur](https://imgur.com/Nwgv8Bv.png)](https://imgur.com/Nwgv8Bv.png)<-

>best quality, masterpiece, ultra-detailed, illustration, sharp, 1girl, skinny, (megumin_\(konosuba\):1.1), konosuba, red dress, brown wizard hat, bandages, forest, countryside, scenery of mountain range

>Negative prompt: (worst quality, low quality:1.3), multiple views, blurry

>Steps: 20, Sampler: DPM++ 2M Karras, CFG scale: 7, Seed: 2596161498, Size: 640x448, Model hash: 30953ab0de, Model: [Meina V8 pruned](https://civitai.com/models/7240?modelVersionId=20322), Denoising strength: 0.6, Clip skip: 2, ENSD: 31337, Hires upscale: 2, Hires upscaler: Latent 

***

->[![Imgur](https://imgur.com/o6r9PXc.png)](https://imgur.com/o6r9PXc.png)<-

>best quality, masterpiece, ultra-detailed, illustration, sharp, detailed background, 1girl, (aqua_\(konosuba\):1.1), konosuba, blue dress, bare shoulders, detached sleeves, long cyan hair, cowboy shot, smug face, beach, seashore

>Negative prompt: (worst quality, low quality:1.4), multiple views, blurry, jpeg artifacts

>Steps: 20, Sampler: DPM++ 2M Karras, CFG scale: 7, Seed: 3135377296, Size: 640x448, Model hash: 30953ab0de, Model: [Meina V8 pruned](https://civitai.com/models/7240?modelVersionId=20322), Denoising strength: 0.5, Clip skip: 2, ENSD: 31337, Hires upscale: 2, Hires upscaler: 4x_Valar_v1 ```

***
->[![Imgur](https://imgur.com/UiZ8ci4.png)](https://imgur.com/UiZ8ci4.png)<-

>masterpiece:1.2, best quality:1.2, 1girl, beautiful, multicolored hair, blue hair, silver hair, toxic hair, happy, catgirl, cat ears, cowboy shot, night, stars, absurdres, realistic shadows, dynamic light, detailed face, intricate details:1.2, detailed scenery, uhd

>Negative prompt: nsfw, (worst quality, low quality:1.4), (jpeg artifacts:1.2), (depth of field, bokeh, blurry:1.0), text, title, logo, signature, (bad-hands-5:0.8), simple background, multiple views

>Steps: 26, Sampler: DPM++ 2M Karras, CFG scale: 8.5, Seed: 2992282014, Size: 640x448, Model hash: 553398964f, Model: [AOM3A2](https://huggingface.co/WarriorMama777/OrangeMixs), Denoising strength: 0.6, Clip skip: 2, ENSD: 31337, Hires upscale: 2, Hires upscaler: Latent ```

***

->[![Imgur](https://imgur.com/6DFktu0.png)](https://imgur.com/6DFktu0.png)<-

>fox girl, absurdly long white hair, fox tail, red eyes, pale skin,bikini swinsuite, nature, lake, dark night, sitting, full body, highly detailed, beautiful, small details, ultra detailed, best quality, intricate, hyperrealism, sharp, digital illustration, detailed, realism, intricate, 4k, 8k, trending on artstation, good anatomy, beautiful lighting, award-winning, photorealistic, realistic shadows, realistic lighting, beautiful lighting, raytracing, intricate details, moody, rule of thirds, masterpiece, (illustration:1.1), highres, (extremely detailed CG, unity, 8k wallpaper:1.1), beautiful face, highly detailed face, ultra realistic, masterpiece, extremely detailed, intricate, zoomout

>Negative prompt: (worst quality, low quality:1.3), multiple views, animal, text, signature, blurry, sleeves

>Steps: 20, Sampler: DPM++ 2M Karras, CFG scale: 7, Seed: 1612260674, Size: 448x640, Model hash: 30953ab0de, Model: [Meina V8 pruned](https://civitai.com/models/7240?modelVersionId=20322), Denoising strength: 0.5, Clip skip: 2, ENSD: 31337, Hires upscale: 2, Hires upscaler: 4x_Valar_v1 ```

***

->[![Imgur](https://imgur.com/hGTjOOh.png)](https://imgur.com/hGTjOOh.png)<-

>masterpiece:1.2, best quality:1.2, 1girl, reimu hakurei, red hakama, miko, red bow, dinamic pose, cowboy shot, sunrays, clouds, dynamic light, detailed face, intricate details:1.2, detailed scenery, uhd

>Negative prompt: nsfw, (worst quality, low quality:1.4), (jpeg artifacts:1.2), (depth of field, bokeh, blurry:1.0), text, title, logo, signature

>Steps: 26, Sampler: DPM++ 2M Karras, CFG scale: 8.5, Seed: 4122488606, Size: 640x448, Model hash: d01a68ae76, Model: [pastelMixStylizedAnime_pastelMixPrunedFP16](https://civitai.com/models/5414?modelVersionId=6297), Denoising strength: 0.6, Clip skip: 2, ENSD: 31337, Hires upscale: 2, Hires upscaler: Latent ```

#Обзор основных параметров и фич

##FAQ
>Q: При запуске webui ругается **python not found**
A: Переустанови скачанный питон и не забудь поставить галочку “add to path” как на картинке в начале или сам прогугли как добавить туда питон
>Q: При запуске и установке прогресс прерывается ошибкой и ругается на несовместимость версий
A: Скачивать нужно именно python **3.10** (не ниже 3.10.6), на других версиях работать не будет (будет если ты ищешь приключений)
>Q: У меня ничего не работает, нажимаю **Generate** но оно не выдает пикчу
A: Открываешь консоль, которая появилась после запуска webui и читаешь ошибку, которая там появляется
>Q: Выдает шум вместо картинки
A: Ты выбрал VAE или что-то еще вместо модели StableDiffusion
>Q: Выдает черные квадраты или ошибки про NaN в консоли
A: Увы, выбранное тобой VAE с изъяном, добавь в параметры запуска --no-half-vae или замени его на другое
>Q: Цвета на картинках выцветшие и очень бледные, местами видны какие-то фиолетовые синяки
A: Ты забыл выбрать VAE, выбери и не забывай
>Q: На этапе highresfix выдает ошибку **CUDA out of memory**
A: Если у тебя менее 6 гигабайт VRAM или амд – смириться или искать решения, например Tiled VAE о котором далее, если более то проверь отвал xformers, отключи лайвпревью в одноименном разделе настроек, попробуй убрать в ноль настройку `VRAM usage polls per second during generation`.
>Q: После хайрезфикса у меня все мутное и в каких-то квадратах или сетке
A: Latent апскейлер не работает с низкими денойзами, 0.55-0.6 – минимальное значение
>Q: У меня получается уродские некрасивые пикчи не совпадающие с примерами
A: Проверь правильно ли вбил промт, не забыл ли указать негатив, проверь настройки, которые необходимо было выставить после первого запуска
>Q: Что за masterpiece, best quality, 8k, absurdres, unity
A: Теги, которые вызывают у модели определенные ассоциации с датасетом обучения и смещают стиль в нужную сторону. Их работа зависит от модели, где-то они будут работать, где-то наоборот все испортят.
>Q: Что значит (fluffy fox tail:1.2) и вообще эти скобки и цифры?
A: Вес тегов, прочитать про это и другие возможности webui можно [здесь](https://github.com/AUTOMATIC1111/stable-diffusion-webui/wiki/Features)

##PNG-info

По умолчанию все параметры генерации сохраняются в метаданные сгенерированных картирок. Если перейти на вкладку PNG-info и перетащить сгенерированную пикчу в поле на ней, то можно посмотреть эту информацию, или отправить их все в txt2img или img2img.

->![Imgur](https://imgur.com/N9nrBkK.png)<-

Стоит отметить что на доброй половине пикчехостингов и борд (imgur и 2ch.hk в их числе) при загрузке затирается метадата, поэтому получить какую-либо информацию из скачанных оттуда картинок не получится.

##Clip skip

Параметр отвечает за количество пропускаемых (в конце) слоев нейросети текстового энкодера. Более подробно почитать можно в гугле, важнее то как это влияет на генерации.
Дело в том, что как основная модель NAI, на которой основаны почти все аниме-модели, так и большая часть их файнтюна проходила с параметром clip-skip = 2, соответственно, при установке значений меньше полезут или нулевые тензоры, или неведомые коэффициенты, что приведет к поломке модели.
Однако, в современных моделях часто подмешано немало чекпоинтов на реалистичные изображения, в который дефолтный clipskip = 1, что немного смягчает проблему, а также поломка модели не означет что она перестает работать. Типичный пример можно наблюдать ниже

->[![Пример с обычными тегами](https://imgur.com/OKp2Hcm.jpg)](https://imgur.com/OKp2Hcm.jpg)<-

>best quality, masterpiece, ultra-detailed, illustration, sharp, detailed background, 1girl, pink hair, hips, legs, outdoors, sitting in grass, black panties, spread legs, full body, clouds, sky, birds, butterflies, highly detailed, beautiful, small details, ultra detailed, intricate, sharp, digital illustration, 4k, 8k, rule of thirds, masterpiece, (extremely detailed CG, unity, 8k wallpaper:1.1)
>Negative prompt: nsfw, (worst quality, low quality:1.4), multiple views, blurry, jpeg artifacts, covered navel, bokeh
>Steps: 20, Sampler: DPM++ 2M Karras, CFG scale: 7, Seed: 3669695287, Size: 512x640, Model hash: 7f96a1a9ca, Model: anythingV5Anything_anythingV5PrtRE, Denoising strength: 0.6, ENSD: 31337, Hires upscale: 2, Hires upscaler: Latent

В случае с Clip Skip = 2 в правой части мы действительно наблюдаем варианты сидящей в траве девушки с раздвинутыми ногами, которую окружают птицы и бабочки. В левой части с Clip Skip = 1 птицы перемешались с бабочками, ноги раздвигает тянка уже не так охотно, зато сама мутирует в бабочку и пугает бадихоррором.
Фактически, если выбрать clip skip 1 то поведение модели меняется, игнорируются некоторые теги с бур и на стиль, игнорируются разделители между тегами, растет вероятность получения бадихоррора и фрактальных структур (особенно при отклонении от 512х512 при генерации). Ниже пример игнорирования стиле-тегов.

->[![Пример с тегами стиля](https://imgur.com/mOPUtHv.jpg)](https://imgur.com/mOPUtHv.jpg)<-

>best quality, masterpiece, ultra-detailed, illustration, sharp, detailed background, 1girl, pink hair, hips, legs, outdoors, sitting in grass, black panties, spread legs, full body, clouds, sky, (dark night,dark colors, low color gamma,low brightness:1.3), birds, butterflies
>Negative prompt: nsfw, (worst quality, low quality:1.4), multiple views, blurry, jpeg artifacts, covered navel, bokeh
>Steps: 20, Sampler: DPM++ 2M Karras, CFG scale: 7, Seed: 876316548, Size: 512x640, Model hash: 7f96a1a9ca, Model: anythingV5Anything_anythingV5PrtRE, Denoising strength: 0.6, Clip skip: 2, ENSD: 31337, Hires upscale: 2, Hires upscaler: Latent

Эффект на лице, идеально для генерации ебала.
Но в то же время само по себе изменение стиля генераций при этом может показаться симпатичным, а среди говняка проскакивают крайне ахуенные пикчи.
!!!note Любишь рулеточку и знаешь что делаешь - вперед экспериментировать
	а если ты ньюфаг или не стремишься к экспреиментам – **==не лезь блять, она тебя сожрет==**

##Семплеры

Семплеров в webui много, но действительно полезных единицы. Внимания достойны:
- **Euler**
Работает быстро, стабильно, минимальное количество лишних элементов. Из недостатков – невысокая детализация, «плоские» цвета. Больше 30 шагов смысла ставить нет, обычно 20 достаточно. Вариация Euler a в целом похожа, по задумке должна обеспечивать более стабильный результат за малое число шагов, аналогично.
- **DDIM** 
Работает быстро, добавляет много деталей. Осветляет темные участки (где-то в плюс по детализации, где-то в минус по контрасту). Из недостатков – менее устойчив, может дорисовывать лишний шум, делает темные пятна на пикчах (заметно при апскейле). Рекомендуется ~30 шагов для того чтобы все устаканилось и не поймать хтонь во время перестройки картинки.
- **DPM++ 2M Karras**
Дает много деталей, при резкой но гладкой картинке, сохраняя цвета и гамму. Из минусов – может запутаться в волосах-одежде объединив их (как и другие на самом деле), и работает медленнее. Достаточно 20 итераций, в особых случаях не более 30.
- **UniPC** 
Быстрый, на хайпе, иногда может дать интересный результат, особенно на некоторых стилях, а иногда херня из под коня. Рекомендуется не менее 30 итераций.

->[![Семплеры](https://imgur.com/XJNF8sz.jpg)](https://imgur.com/XJNF8sz.jpg)<-

##Как генерировать пиздато

- Не забывай прописывать негатив, если только твоей целью не является генерация крипотных зомби
- Не стесняйся использовать теги-улучшайзеры, те же masterpiece, best quality
- Не засирай бездумно промт повторяющимися словами и «волшебными тегами» и шизоидными конструкциями, которые просто подсмотрел у кого-то. Они не обязательно будут работать, а могут работать иначе, кроме того большой промт ухудшает управляемость. То же справедливо и для негатива
- Особое внимание следует обращать на взаимоисключающие теги и также повторение одного или похожих как в позитиве, так и в негативе. В большинстве случаев это просто приводит к поломке, а для «уточнения» стоит использовать другие формулировки или прочие приемы
- Используй рекомендованные параметры для модели, они обычно указаны на ее странице. Например, AOM нуждается в негативе (worst quality, low quality) с весом 1.2-1.4, а третья версия так и вовсе предполагает целые полотна, для того чтобы избавиться от мыла на фоне, раздолбанных анусов при легких эччи генерациях и т.д., благо об этом можно прочитать на странице с описанием
- Выбирай совместимый VAE, некоторые модели не работают нормально с 84k и подобными, ClearVae может быть решением в таких случаях
- Смотри примеры пикч к моделям и результаты из комментариев, на Civitai большая часть заливается с промтом, его можно увидеть справа
- Следует избегать больших весов тегов (в большинстве случаев разумная граница на объект 1.3, на стиль 1.5), а также не нужно повышать вес тегу если он и так работает. Например, (((1girl))) – плохая идея, если нужно убрать остальных персонажей то лучше добавить тег solo, а в негативы 2girls/multiple characters
- CFG Scale должно быть в диапазоне от 6 до 14, если нет необходимости получить определенный стиль
- Отклонение от 0.25 мегапикселей или разрешения 512х512 будет приводить к ухудшению качества, исключения есть но они редки. Для повышения разрешения используй хайрезфикс и дальнейший апскейл
- Применяй разные семплеры под разные задачи, не стоит ждать кучи деталей от Euler и наоборот страдать с DPM++ 2M Karras в гладкой стилизованной пикче
- Используй негативные (в Negative promt) эмбединги
	-	[Bad-hands-5](https://huggingface.co/yesyeahvh/bad-hands-5/tree/main) – улучшает выход нормальных пальцев на руках, с весом до единицы почти не влияет на изображение
	-	[Easynegative](https://huggingface.co/datasets/gsdf/EasyNegative) – хорошо работает в большинстве случаев, однако, может поменять конечный стиль пикчи и затруднить некоторые необычные генерации
	-	[Bad-Promt-v2](https://huggingface.co/datasets/Nerfgun3/bad_prompt) – очень сильно меняет стиль, если нравится результаты – вперед
- Экспериментируй и смотри примеры других. В гайде описаны лишь общие базовые подходы, техник, вариантов и прочего колоссальное разнообразие

#Апскейл

На текущем уровне развития генеративных моделей создание картинок сразу в высоком разрешении невозможно. При попытке сразу выставить разрешение, сильно отличающееся от ~0.3 мегапикселей для SD 1.5 – based моделей (исключения редки), на выходе получится знатный бадихоррор или в лучшем случае несколько копий персонажа.

 ->Генерация 512х512 и хайрезфикс х2 - - - Генерация сразу в 1024х1024 <-

->[![Семплеры](https://imgur.com/IrOMmjc.jpg)](https://imgur.com/IrOMmjc.jpg)<-

Для получения пикч высокого разрешения из исходных мелких генераций используют различные методы апскейла, один из которых как раз и является Hires Fix, удобно встроенный в процесс генерации картинок из промта. Однако, сделать им хорошую картинку сразу высокого разрешения, а не ~1280x1280 почти невозможно по ряду причин, самая простая из которых – ограниченный объем VRAM. И даже если вы счастливый обладатель видеокарты с 24+гб, качество результата будет далеко от отличного. Поэтому, для получения хайрезов чаще всего используется тайловый апскейл в различных вариациях, суть которого в обработке картинки GAN – апскейлером с дальнейшим разбиением на малые части и их поочередным прогоном через img2img.
По апскейлу уже есть некоторые гайды, например [1](https://rentry.org/SD_upscale) [2](https://rentry.org/sd__upscale), поэтому здесь остановимся на том, как получить хороший результат.
Также стоит отметить аддон tiled diffusion, который позволяет делать апскейл по иному принципу. Про один из вариантов его применения можно почитать [здесь](https://rentry.org/UpscaleByControl)
!!!info Прежде всего следует скачать дополнительные GAN модели
	 по [ссылке](https://upscale.wiki/wiki/Model_Database)
Рекомендуется попробовать `4x-Valar`, `4x_NMKD-Siax_200k`, `4x-UltraSharp`, `4x_foolhardy_Remacri`. Они сильно влияют на итоговый результат, его резкость/детальность, также могут влиять на баланс белого и цветовой тон. Скачанные файлы (`%name%.pth`) необходимо скопировать в папку `./models/ESRGAN` и перезапустить web-ui.
***
##Пример
!!!info Операции с апскейлом пикч проводятся на вкладке ==**img2img**==
	Для удобства, чтобы не вбивать заново все параметры, рекомендуется пользоваться кнопкой send to img2img.

В sd-webui есть встроенная реализация тайлового апскейла. Для того чтобы ее найти, перекидываем интересующую пикчу (первый референс пример) в ==**img2img**==, мотаем в самый низ до ==**Scripts**== и в них выбираем ==**SD-upscale**==

->![Imgur](https://imgur.com/f3GJ4lo.png)<-

Из управления у него 2 ползунка и выбор апскейлера, также можно управлять размером тайла меняя разрешение в основных параметрах.

Для начала скидываем первую референс пикчу из примера, выполненную с латент-хайрезфиксом, выбираем `Denoising strength` = `0.4`, семплер `DPM++ 2M Karras`, в качестве апскейлера ставим `R-ESRGAN 4x+ Anime6B`, ставим сид `841659311` остальные параметры оставляем по дефолту и запускаем генерацию

->![Imgur](https://imgur.com/yFvKgoT.png)<-

Спустя некоторое время у нас должна появиться следующая пикча

->[![Референс апскейл](https://imgur.com/If29HdT.jpg)](https://imgur.com/If29HdT.jpg)<-

Задача выполнена, повторять до полного удовлетворения.

##Повышение качества и детализации

На самом деле при подобном апскейле существует множество нюансов, которые происходят из самой его сути. Прежде всего, нужно понимать, что в один момент обрабатывается лишь некоторый кусок картинки (по умолчанию используется матрица 3x3), который прогоняется через ==img2img== с **заданным промтом**. Из этого вытекает три очевидные вещи:

-	Как и с дефолтной обработкой пикчи в img2img дополнительные детали и четкость зависят от уровня денойза
-	Указанный промт, где подробно расписана девочка, ее одеяния и поза, будет применяться к отдельным участкам фона где ее или вообще может не быть, или присутствует лишь часть тела или одежды
-	Полученный набор нарезанных кусочков, которые обрабатывались независимо, потом потребуется склеивать

Опустив пока третий, рассмотрим остальные. Из первого пункта следует что нужно ставить денойз больше для получения наиболее резкого и детального изображения, однако, из-за второго это приведет к тому, что модель будет пытаться сделать из любых напоминающих человеческий силуэт объектов ту самую девочку, ведь в промте она есть а пикче нет. Это приводит к появлению «гостов», пример

->[![Госты](https://imgur.com/qLGkD99.jpg)](https://imgur.com/qLGkD99.jpg)<-

На самом деле, обычно, они находятся где-то на фоне или в объектах, но здесь гипертрофированный пример для иллюстрации.
Если же мы снизим денойз то получится хуйня из под коня, на которую невозможно смотреть при 100% масштабе. Поэтому выбор денойза в апскейле похож на балансирование между двумя стульями

->![Imgur](https://imgur.com/1QkN2CL.jpg)<-

!!!note Стоит отметить
    что для некоторых стилей gan-апскейл уже сам по себе дает хороший результат, и на низких денойзах достигается отличное качество изображения, однако такое встречаются не часто

К счастью, в большинстве случаев денойз больше 0.45-0.5 не требуется, поскольку он приводит уже не к росту деталей а к перерисовке и искажению исходной картинки. Минимальное значение денойза для маскировки работы gan апскейлера зависит от многих параметров, но в общем можно выбрать 0.35, причем оно практически не приводит к появлению гостов. Соответственно, изначально выбрав величину в окрестности 0.4 в большинстве случаев можно сразу получить неплохой результат.

!!!Warning На финальный результат и оптимальную величину денойза влияет семплер
	из-за их разной специфики работы те параметры, что дают отличный результат для одного могут порождать крипоту для другого.
	Замечено, что при денойзах 0.4 и более Euler гораздо чаще ломает тела и согздает гостов, чем 2м - карась

***

Далее, следует отредактировать промт, учитывая то на какие тайлы по факту он будет применяться.
Первое что нужно выкинуть в любом случае – **теги на план и ракурс**. Всякие ==full body, cowboy shot== и подобное сразу нахуй, быстро и решительно. Особым любителям отдалять персонажа **из негатива** следует убрать ==closeup, cropped== и все подобное. Некоторое улучшение и починку пальцев можно получить, добавив `accurate arms and fingers` или подобные теги.
Делается все это просто и быстро и уже дает 90% успеха вместе с нормальным денойзом.

->[![Aqua](https://imgur.com/stDeyY7.png)](https://imgur.com/stDeyY7.png)<-

>best quality, masterpiece, ultra-detailed, illustration, sharp, detailed background, 1girl, (aqua_\(konosuba\):1.1), konosuba, blue dress, bare shoulders, detached sleeves, long cyan hair, smug face, beach, seashore
>Negative prompt: (worst quality, low quality:1.4), multiple views, blurry, jpeg artifacts
>Steps: 20, Sampler: DPM++ 2M Karras, CFG scale: 7, Seed: 735012152, Size: 1280x896, Model hash: 30953ab0de, Model: meinamix_meinaV8, Denoising strength: 0.47, Clip skip: 2, ENSD: 31337, SD upscale overlap: 64, SD upscale upscaler: R-ESRGAN 4x+ Anime6B

->[![Megumin](https://imgur.com/sG6Athj.png)](https://imgur.com/sG6Athj.png)<-

>best quality, masterpiece, ultra-detailed, illustration, sharp, 1girl, skinny, (megumin_\(konosuba\):1.1), konosuba, red dress, brown wizard hat, bandages, forest, countryside, scenery of mountain range
>Negative prompt: (worst quality, low quality:1.3), multiple views, blurry
>Steps: 20, Sampler: DPM++ 2M Karras, CFG scale: 7, Seed: 1310064321, Size: 1280x896, Model hash: 30953ab0de, Model: meinamix_meinaV8, Denoising strength: 0.37, Clip skip: 2, ENSD: 31337, SD upscale overlap: 96, SD upscale upscaler: SwinIR 4x


!!!info При апскейле большую роль играют теги-улучшайзеры
	masterpiece, best quality и подобные, а также все те, что работают на конкретной модели и соответствуют желаемому стилю должны быть в промте
Не стоит забывать про негатив, простой ==simple background, blurry== и т.д. не менее важны.
В некоторых случаях (особенно с дженерик тянками лол) возможно сокращение промта только до тегов-улучшайзеров, например:

->[![Imgur](https://imgur.com/hTWDT3P.png)](https://imgur.com/hTWDT3P.png)<-

>masterpiece:1.2, best quality:1.2, , intricate details:1.2, detailed scenery, uhd
>Negative prompt: nsfw, (worst quality, low quality:1.4), (lip, nose, tooth, rouge, lipstick, eyeshadow:1.4), (blush:1.2), (jpeg artifacts:1.4), (depth of field, bokeh, blurry, film grain, chromatic aberration, lens flare:1.0), (1boy, abs, muscular, rib:1.0), greyscale, monochrome, dusty sunbeams, trembling, motion lines, motion blur, emphasis lines, text, title, logo, signature,
>Steps: 24, Sampler: DPM++ 2M Karras, CFG scale: 7, Seed: 2758835439, Size: 1024x1024, Model hash: 7f96a1a9ca, Model: anythingV3V5Anything_anythingV5PrtRE, Denoising strength: 0.42, Clip skip: 2, ENSD: 31337, SD upscale overlap: 96, SD upscale upscaler: R-ESRGAN 4x+ Anime6B

К сожалению, с лисичками, кошечками и прочими ушастыми это проходит не всегда и ==fox girl, cat tail== и т.п. оставлять необходимо, дабы важные части не становились элементами одежды.
***
Бывают случаи, когда все в пикче устраивает, но присутствует один-два неприятных госта – запускаем еще раз ничего не трогая (с другим сидом, разумеется), как правило они исчезают.
Наконец, ультимативным решением может быть использование одновременно всех описанных приемов – генерируем несколько вариантов апскейла, в том числе с разными настройками, а затем в любом графическом редакторе склеиваем, выбирая от каждого наиболее удачные части.

##Ultimate SD Upscale

У встроенного скрипта тайлового апскейла в webui существуют пара серьезных недостатков:
-	Большая ширина зоны перекрытия при склеивании, из-за чего эти самые склейки часто очень заметны, если проходятся по телу и особенно лицу
-	Неудобная и ограниченная настройка размера тайла

Первый можно видеть достаточно часто, а параметр Tile overlap влияет на нее очень слабо, поскольку определяет перекрытие при разбитии исходной картинки на фрагменты и не влияет на сборку конечной пикчи где все это происходит.
Второй менее явный и не самый очевидный при апскейле пикч с разрешением около 1 мегапикселя и аналогичным размером тайла, однако при его повышении результат быстро начинает портиться, и вместо высокодательного абсурдреса на выходе получается лишь плоское зашумленное нечто даже при использовании хороших gan-апскейлеров и высокого денойза. Причина аналогична той, из-за которой не получаются хорошие генерации сразу в высоком разрешении – потери когерентности, только в случае обработки уже имеющегося изображения дела обстоят несколько лучше, и диффузионная модель может стабильно выдавать что-то разумное вплоть до разрешений ~2-2.5 мегапикселя, а на 1 мпкс работает даже хорошо.
***
Решить оба этих недостатка нам поможет костыль Ultimate SD Upscale.
Ставится также как и остальные экстеншены:
- в веб интерфейсе переходим на вкладку **==Extensions==**, ниже в окно **==Available==**
- жмем кнопку **==Load from:==** ничего не меняя.
- в поле поиска начинаем вбивать Ultimate, находим нужное, нажимаем Install, ждем окончания скачивания
- идем в раздел Installed где жмем Apply and restart UI.

Теперь вместо обычного SD upscale выбираем свежеустановленный Ultimate и изучаем его параметры.

->![Imgur](https://imgur.com/yLWYefy.png)<-

-	Target size type – задается конечный размер результирующей пикчи, лучше всего выбрать Scale from image size и ползунком выставить множитель
-	Upscaler – тип GAN-апскейлера, которым будет происходить первичная обработка, все аналогично описанному выше.
-	Type – способ разбиения на тайлы, Linear делает обычную решетку как в случае SD upscale, Chess – разбивает в шахматном порядке. Второе как правило лучше, но медленнее ввиду большего количества перекрытий, в большинстве случаев хватает Linear.
-	Tile width, Tile height – размер тайлов, если второй параметр равен нулю то будут квадраты с размером стороны из первого поля. Малый размер тайла плох тем, что захватывает малый участок картинки и на нем денойз проходит гораздо агрессивнее (хотя у тех у кого мало VRAM нет выбора), слишком большой тоже хуев тем что на выходе будет или плоская ерунда с шумом и ган-артефактами, или же мелкие детали, например, пальцы, начнет завязывать в узлы. Для апскейла после хайрезфиксов стоит использовать в интервале от 768 до 1536
-	Mask blur – ширина оверлапа и плавного градиента при склейке тайлов. Дефолтный параметр хорош, повышать стоит только при обработке оче больших разрешений, где тайлы, попадающие на фон, начинают приобретать сильно разные оттенки и видны их склейки. Офк при повышении распидарасит мелкие детали и персонажей.
-	Padding – ширина перекрытия при разбиении на тайлы, стоит поднимать если заметны склейки разных оттенков, фактически плюсуется к размеру обрабатываемого тайла.

Также есть возможность постобработки склеек в Seams fix, однако первая простая опция, как правило, делает только хуже и проявляет стыки, которых даже не было видно, а остальные заметно повышают время обработки и не всегда дают лучший результат. При желании каждый может покрутить доступные параметры и посмотреть на результаты, однако не забудь выставить галку напротив Seams fix ниже в Save options.
Недостатки у аддона тоже присутствуют, основной – отсутствие поддержки батчей, при их выборе кратно вырастет время обработки, но на выходе все равно будет одна пикча.
- примеры

->[![Imgur](https://imgur.com/fhTURad.png)](https://imgur.com/fhTURad.png)<-
>masterpiece:1.2, best quality:1.2, 1girl, beautiful, multicolored hair, blue hair, silver hair, toxic hair, happy, catgirl, cat ears, night, stars, absurdres, realistic shadows, dynamic light, detailed face, intricate details:1.2, detailed scenery, uhd, accurate arms and fingers

>Negative prompt: nsfw, (worst quality, low quality:1.4), (jpeg artifacts:1.2), (depth of field, bokeh, blurry:1.0), text, title, logo, signature, (bad-hands-5:0.8), simple background, multiple views

>Steps: 26, Sampler: DPM++ 2M Karras, CFG scale: 8.5, Seed: 3456324322, Size: 2816x1984, Model hash: 553398964f, Model: AOM3A2, Denoising strength: 0.42, Clip skip: 2, ENSD: 31337, Ultimate SD upscale upscaler: 4x_NMKD-Siax_200k, Ultimate SD upscale tile_width: 960, Ultimate SD upscale tile_height: 960, Ultimate SD upscale mask_blur: 8, Ultimate SD upscale padding: 48

->[![Imgur](https://imgur.com/qDl9p4h.png)](https://imgur.com/qDl9p4h.png)<-
>fox girl, absurdly long white hair, fox tail, red eyes, pale skin,bikini swinsuite, nature, lake, dark night, highly detailed, beautiful, small details, ultra detailed, best quality, intricate, hyperrealism, sharp, digital illustration, detailed, realism, intricate, 4k, 8k, trending on artstation, good anatomy, beautiful lighting, award-winning, photorealistic, realistic shadows, realistic lighting, beautiful lighting, raytracing, intricate details, moody, rule of thirds, masterpiece, (illustration:1.1), highres, (extremely detailed CG, unity, 8k wallpaper:1.1), beautiful face, highly detailed face, ultra realistic, masterpiece, extremely detailed, intricate, zoomout

>Negative prompt: (worst quality, low quality:1.3), multiple views, animal, text, signature, blurry, sleeves

>Steps: 20, Sampler: DPM++ 2M Karras, CFG scale: 7, Seed: 1612260674, Size: 1984x2816, Model hash: 30953ab0de, Model: meinamix_meinaV8, Denoising strength: 0.43, Clip skip: 2, ENSD: 31337, Ultimate SD upscale upscaler: 4x_foolhardy_Remacri, Ultimate SD upscale tile_width: 960, Ultimate SD upscale tile_height: 960, Ultimate SD upscale mask_blur: 8, Ultimate SD upscale padding: 48

->[![Imgur](https://imgur.com/uBnc3sx.png)](https://imgur.com/uBnc3sx.png)<-
>masterpiece:1.2, best quality:1.2, 1girl, reimu hakurei, red hakama, miko, red bow, dinamic pose, sunrays, clouds, dynamic light, detailed face, intricate details:1.2, detailed scenery, uhd

>Negative prompt: nsfw, (worst quality, low quality:1.4), (jpeg artifacts:1.2), (depth of field, bokeh, blurry:1.0), text, title, logo, signature

>Steps: 26, Sampler: DPM++ 2M Karras, CFG scale: 8.5, Seed: 3944076798, Size: 2944x2112, Model hash: d01a68ae76, Model: pastelMixStylizedAnime_pastelMixPrunedFP16, Denoising strength: 0.45, Clip skip: 2, ENSD: 31337, Ultimate SD upscale upscaler: 4x_foolhardy_Remacri, Ultimate SD upscale tile_width: 896, Ultimate SD upscale tile_height: 896, Ultimate SD upscale mask_blur: 8, Ultimate SD upscale padding: 64






***
v0.1f