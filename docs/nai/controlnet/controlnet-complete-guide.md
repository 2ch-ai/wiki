# ControlNet: A Complete Guide

!!! info "Первоисточник"
    Эта статья представляет собой перевод данного англоязычного руководства редакции от 16 марта 2024 года:

    <https://stable-diffusion-art.com/controlnet/>

ControlNet - это нейросеть, которая контролирует генерацию картинок в Stable Diffusion, добавляя дополнительные условия. Подробности можно найти в статье [Adding Conditional Control to Text-to-Image Diffusion Models](https://arxiv.org/abs/2302.05543) от Lvmin Zhang и его коллег.

ControlNet полностью меняет правила игры. С его помощью можно, например:

* Задавать позы людей.
* Копировать композиции с других картинок.
* Генерировать похожее картинки.
* Превращать каракули в профессиональные изображение.

В этой статье ты узнаешь всё, что нужно, про ControlNet.

* Что такое ControlNet и как он работает.
* Как поставить ControlNet на Windows, Mac и Google Colab.
* Как пользоваться ControlNet.
* Объяснение всех моделей ControlNet.
* Несколько примеров использования.

Этот гайд про ControlNet для Stable Diffusion v1.5. Для [ControlNet с SDXL](https://stable-diffusion-art.com/controlnet-sdxl/) смотри отдельный гайд.

## Что такое ControlNet?

ControlNet - это нейросетевая модель для управления [моделями Stable Diffusion](https://stable-diffusion-art.com/how-stable-diffusion-work/). Вы можете использовать ControlNet с любыми вариантами моделей Stable Diffusion.

Основной способ использования моделей Stable Diffusion - это text-to-image (txt2img). Он использует текстовые промпты в качестве условия ([conditioning](https://stable-diffusion-art.com/how-stable-diffusion-work/#Conditioning)) для управления генерацией изображений, чтобы вы могли создавать изображения, соответствующие текстовому описанию.

**ControlNet добавляет еще одно условие** в дополнение к текстовому промпту. Это дополнительное условие может принимать различные формы в ControlNet.

Позвольте мне показать вам два примера того, что может делать ControlNet: Управление генерацией изображений с помощью (1) обнаружения краев и (2) обнаружения позы человека.

### Пример обнаружения краев

Как показано ниже, ControlNet принимает дополнительное входное изображение и обнаруживает его контуры с помощью детектора краев Canny. Затем изображение, содержащее обнаруженные края, сохраняется как **карта управления (control map)**. Она подается в модель ControlNet в качестве дополнительного условия к текстовому промпту.

<figure markdown="span">
  ![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/openpose-workflow.jpg)
  <figcaption>Stable Diffusion ControlNet с применением обнаружения краёв.</figcaption>
</figure>

Процесс извлечения определенной информации (в данном случае краев) из входного изображения называется **аннотацией** (в [исследовательской статье](https://arxiv.org/abs/2302.05543)) или **препроцессингом** (в расширении ControlNet).

### Пример обнаружения позы человека

Обнаружение краев - не единственный способ предварительной обработки изображения. [Openpose](https://github.com/CMU-Perceptual-Computing-Lab/openpose) - это быстрая модель **обнаружения ключевых точек** человека, которая может извлекать позы человека, такие как положения рук, ног и головы. См. пример ниже.

<figure markdown="span">
  ![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/openpose_overlay_person.png){ width="300" }
  <figcaption>Входное изображение, <br> аннотированное при помощи Openpose</figcaption>
</figure>

Ниже представлен рабочий процесс ControlNet с использованием OpenPose. Ключевые точки извлекаются из входного изображения с помощью OpenPose и сохраняются в виде карты управления, содержащей положение ключевых точек. Затем она подается в Stable Diffusion в качестве **дополнительного условия** вместе с текстовым промптом. Изображения генерируются на основе этих двух условий.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/image-120-1536x625.png)

В чем разница между использованием детектора краев Canny и Openpose? Детектор краев Canny извлекает края объекта и фона в равной степени. Он стремится более точно передать сцену. Вы можете увидеть, что танцующий мужчина превратился в женщину, но контур и прическа сохранились.

OpenPose обнаруживает только ключевые точки человека, такие как положение головы, рук и т.д. Генерация изображения более свободна, но следует исходной позе.

Приведенный выше пример сгенерировал женщину, прыгающую вверх, с левой ступней, указывающей в сторону, в отличие от исходного изображения и изображения в примере с Canny Edge. Причина в том, что обнаружение ключевых точек OpenPose не определяет ориентацию ступней.

## Установка Stable Diffusion ControlNet

(Инструкции обновлены для ControlNet v1.1)

Давайте пройдем через процесс установки ControlNet в [AUTOMATIC1111](https://github.com/AUTOMATIC1111/stable-diffusion-webui), популярном и полнофункциональном (и бесплатном!) графическом интерфейсе Stable Diffusion. Мы будем использовать [это расширение](https://github.com/Mikubill/sd-webui-controlnet), которое является стандартом де-факто для использования ControlNet.

Если у вас уже установлен ControlNet, вы можете перейти к следующему разделу, чтобы узнать, как его использовать.

### Установка ControlNet в Google Colab

!!! quote "Примечание от переводчика"
    Данное руководство предлагает запускать коллаб для AUTO111, но эта возможность, в настоящий момент, блокируется гуглом.

Использовать ControlNet с блокнотом Stable Diffusion Colab в одно нажатие из нашего [руководства по быстрому старту](https://andrewongai.gumroad.com/l/stable_diffusion_quick_start) очень просто.

В разделе Extensions блокнота Colab поставьте галочку напротив ControlNet.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/image-127.png){ width="200" }

Нажмите кнопку **Play**, чтобы запустить AUTOMATIC1111. Вот и все!

### Установка ControlNet на Windows PC или Mac

Вы можете использовать ControlNet с AUTOMATIC1111 на [Windows PC](https://stable-diffusion-art.com/install-windows/) или [Mac](https://stable-diffusion-art.com/install-mac/). Следуйте инструкциям в этих статьях, чтобы установить AUTOMATIC1111, если вы еще этого не сделали.

Если у вас уже установлен AUTOMATIC1111, убедитесь, что он обновлён до последней версии.

#### Установка расширения ControlNet (Windows/Mac)

1. Перейдите на страницу **Extensions**.

2. Выберите вкладку **Install from URL**.

3. Вставьте следующий URL в поле **URL for extension's repository**.

    ```
    https://github.com/Mikubill/sd-webui-controlnet
    ```

4. Нажмите кнопку **Install**.

5. Дождитесь сообщения о подтверждении установки расширения.

6. Перезапустите AUTOMATIC1111.

7. Посетите страницу [моделей ControlNet](https://huggingface.co/lllyasviel/ControlNet-v1-1/tree/main).

8. Загрузите все файлы моделей (имя файла заканчивается на .pth).

    (Если вы не хотите загружать их все, можете пока загрузить модели openpose и canny, которые используются чаще всего.)

9. Поместите файл(ы) моделей в каталог **models** расширения ControlNet.

    ```
    stable-diffusion-webui\extensions\sd-webui-controlnet\models
    ```

10. Перезапустите webui AUTOMATIC1111.

Если расширение успешно установлено, вы увидите новый сворачиваемый раздел на вкладке **txt2img** под названием **ControlNet**. Он должен находиться прямо над выпадающим меню Script.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/image-115.png)

Это указывает на успешную установку расширения.

#### Установка T2I-Adapters

[T2I адаптеры](https://github.com/TencentARC/T2I-Adapter) - это нейросетевые модели для обеспечения дополнительного управления генерацией изображений диффузионных моделей. Они концептуально похожи на ControlNet, но имеют другой дизайн.

<figure markdown="span">
  ![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-148-1536x489.png)
  <figcaption>Описание работы T2I-Adapter</figcaption>
</figure>

Расширение A1111 ControlNet может использовать T2I адаптеры. Вам нужно будет загрузить модели [здесь](https://huggingface.co/TencentARC/T2I-Adapter/tree/main/models). Возьмите те, имена файлов которых имеют вид t2iadapter_XXXXX.pth

Их функциональность во многом пересекается с моделями ControlNet. Я буду рассматривать только следующие две:

* [t2iadapter_color_sd14v1.pth](https://huggingface.co/TencentARC/T2I-Adapter/resolve/main/models/t2iadapter_color_sd14v1.pth)
* [t2iadapter_style_sd14v1.pth](https://huggingface.co/TencentARC/T2I-Adapter/resolve/main/models/t2iadapter_style_sd14v1.pth)

Поместите их в папку моделей ControlNet.
```
stable-diffusion-webui\extensions\sd-webui-controlnet\models
```

### Обновление расширения ControlNet

ControlNet - это расширение, которое быстро развивается. Нередко обнаруживается, что ваша копия ControlNet устарела.

Обновление требуется только в том случае, если вы запускаете AUTOMATIC1111 локально на Windows или Mac. Блокнот Colab на сайте всегда использует последнюю версию расширения ControlNet.

Чтобы определить, является ли ваша версия ControlNet актуальной, сравните номер версии в разделе ControlNet на странице txt2img с [номером последней версии](https://github.com/Mikubill/sd-webui-controlnet/blob/main/scripts/controlnet_version.py).

#### Вариант 1: Обновление из Web-UI

Самый простой способ обновить расширение ControlNet - использовать графический интерфейс AUTOMATIC1111.

1. Перейдите на страницу **Extensions**.
2. На вкладке **Installed** нажмите **Check for updates**.
3. Дождитесь сообщения о подтверждении.
4. Полностью закройте и перезапустите AUTOMATIC1111 Web-UI.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-216.png)

#### Вариант 2: Командная строка

Если вы хорошо знакомы с командной строкой, вы можете использовать этот вариант для обновления ControlNet, который дает вам уверенность в том, что Web-UI не делает чего-го лишнего.

**Шаг 1**: Откройте приложение **Terminal App** (Mac) или приложение **PowerShell** (Windows).

**Шаг 2**: Перейдите в папку расширения ControlNet. (Измените соответствующим образом, если вы установили в другом месте)
    ```
    cd stable-diffusion-webui/extensions/sd-webui-controlnet
    ```
**Шаг 3**: Обновите расширение, выполнив следующую команду.
    ```
    git pull
    ```
## Использование ControlNet - простой пример

Теперь, когда у вас установлен ControlNet, давайте рассмотрим простой пример его использования! Позже вы увидите подробное объяснение каждой настройки.

Чтобы вы могли следовать нижеприведённому руководству, у вас должно быть установлено расширение ControlNet. Вы можете убедиться в этом, найдя секцию ControlNet в нижней части интерфейса.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/image-115.png)

Нажмите на каретку справа, чтобы развернуть панель ControlNet. Она покажет все настройки и холст для загрузки изображений.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-91.png)

Я буду использовать следующее изображение, чтобы показать вам, как использовать ControlNet. Вы можете скачать его, чтобы следовать данному руководству:

![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/controlNet_demo_image-200x300.jpg){ width=150 }

### Настройки Text-to-Image

**ControlNet будет использован восместно с моделью Stable Diffusion**. В выпадающем меню **Stable Diffusion checkpoint** выберите модель, которую вы хотите использовать с ControlNet. Например, выберите v1-5-pruned-emaonly.ckpt, чтобы использовать [базовую модель v1.5](https://stable-diffusion-art.com/models/#Stable_diffusion_v15).

![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/image-140.png)

На вкладке **txt2img** напишите **промпт** и, при желании, негативный промпт, которые будут использоваться ControlNet. Я буду использовать промпты ниже.

Промпт:

    full-body, a young female, highlights in hair, dancing outside a restaurant, brown eyes, wearing jeans

Негативный промпт:

    disfigured, ugly, bad, immature

Установите **размер изображения** для генерации. Я буду использовать ширину 512 и высоту 776 для моего демонстрационного изображения. Обратите внимание, что **размер изображения устанавливается в разделе txt2img, а НЕ в разделе ControlNet**.

Интерфейс должен выглядеть так:

![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/image-128.png)

### Настройки ControlNet

Теперь давайте перейдем к панели ControlNet.

Во-первых, **загрузите изображение** на холст.

Поставьте **галочку Enable**.

Вам нужно будет выбрать **препроцессор** и **модель**. Препроцессор - это просто другое название для аннотатора, упомянутого ранее, такого как детектор ключевых точек OpenPose. Давайте выберем **openpose в качестве препроцессора**.

Выбранная модель ControlNet должна соответствовать препроцессору. Для OpenPose вы должны выбрать **control_openpose-fp16 в качестве модели**.

Панель ControlNet должна выглядеть так:

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-92.png)

Это все. Теперь нажмите **Generate**, чтобы начать генерировать изображения с помощью ControlNet.

Вы должны увидеть, что поза в сгенерированных изображениях такая же как и во входном изображении. Последнее изображение - это результат этапа предобработки. В данном случае это обнаруженные ключевые точки.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/image-130.png)

Когда закончите, снимите галочку **Enable**, чтобы отключить расширение ControlNet.

Это основы использования ControlNet!

Осталось понять:

* Какие препроцессоры доступны (а их действительно много!)
* Какие у ControlNet есть настройки

## Препроцессоры и модели

Первый шаг использования ControlNet - выбрать препроцессор. Полезно **включить предварительный просмотр**, чтобы вы знали, что делает препроцессор. После завершения препроцессинга исходное изображение больше не используется, и только выданное препроцессором изображение будет использоваться для ControlNet.

Чтобы включить предварительный просмотр:

 1. Отметьте **галочку Allow Preview**.
 2. Опционально так же можете отметить **Pixel Perfect**. ControlNet будет использовать заданную вами высоту и ширину изображения в text-to-image для генерации предварительно обработанного изображения.
 3. Нажмите на **значок взрыва** рядом с выпадающим меню **Preprocessor**.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-108.png)

Некоторые модели ControlNet могут слишком сильно влиять на изображение. Уменьшите **Control Weight**, если вы видите проблемы с цветом или другие артефакты.

### Выбор правильной модели

После выбора препроцессора вы должны выбрать правильную модель.

Для моделей серии v1.1 легко определить, какую модель нужно использовать. Все, что вам нужно сделать, это выбрать модель с тем же ключевым словом, что и у препроцессора.

Например:

| Препроцессор | Модель |
|-|-|
| depth_xxxx | control_xxxx_depth 
| lineart_xxxx | control_xxxx_lineart 
| openpose_xxxx | control_xxxx_openpose 

### OpenPose

Для OpenPose есть несколько вариантов препроцессоров.

[OpenPose](https://github.com/CMU-Perceptual-Computing-Lab/openpose) обнаруживает ключевые точки человека, такие как положение головы, плеч, рук и т.д. Он полезен для копирования человеческих поз без копирования других деталей, таких как одежда, прически и фон.

Все препроцессоры openpose должны использоваться с моделью **openpose** в выпадающем меню Model ControlNet.

Препроцессоры OpenPose:

* **OpenPose**: глаза, нос, шея, плечи, локти, запястья, колени и лодыжки.
* **OpenPose_face**: OpenPose + детали лица
* **OpenPose_hand**: OpenPose + руки и пальцы
* **OpenPose_faceonly**: только детали лица
* **OpenPose_full**: Все вышеперечисленное
* **dw_openPose_full**: Улучшенная версия OpenPose_full

Совет: Используйте Dw OpenPose чтобы извлечь все детали.

#### OpenPose

OpenPose - это базовый препроцессор OpenPose, который обнаруживает положение глаз, носа, шеи, плеч, локтей, запястий, коленей и лодыжек.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/controlNet_demo_image.jpg){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/openpose.png){ width=45% }

#### OpenPose_face

OpenPose_face делает все то же самое, что и препроцессор OpenPose, но обнаруживает дополнительные детали лица.

Он полезен для копирования выражения лица.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/sit7.png){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-94.png){ width=45% }

Пример изображений:

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-97.png){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-98.png){ width=45% }

#### OpenPose_faceonly

OpenPose face only обнаруживает только лицо, но не другие ключевые точки. Это полезно для копирования только лица, но не других ключевых точек.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/sit7.png){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/face-only.png){ width=45% }

Примеры text-to-image приведены ниже. Обратите внимание, что положение тела не задаётся.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-95.png){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-96.png){ width=45% }

#### OpenPose_hand

OpenPose_hand обнаруживает ключевые точки, как OpenPose, а также руки и пальцы.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/leisure-time-1551708_640.jpg){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-99.png){ width=45% }

Пример изображений:

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-100.png){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-101.png){ width=45% }

#### OpenPose_full

OpenPose full обнаруживает все, что openPose face и openPose hand делают суммарно.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/leisure-time-1551708_640.jpg){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-102.png){ width=45% }

Пример изображений:

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-103.png){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-104.png){ width=45% }

#### dw_openpose_full

[DWPose](https://github.com/IDEA-Research/DWPose) - это новый алгоритм обнаружения позы, основанный на исследовательской статье [Effective Whole-body Pose Estimation with Two-stages Distillation](https://arxiv.org/abs/2307.15880). Он выполняет ту же задачу, что и OpenPose Full, но справляется лучше. Я советую вам использовать **dw_openpose_full** вместо **openpose_full**.

Обновите ControlNet, если не видите **dw_openpose_full** в меню **препроцессора**.

<figure markdown="span">
  ![](https://stable-diffusion-art.com/wp-content/uploads/2023/08/sit7.png)
  <figcaption>Референсное изображение для OpenPose и DW OpenPose.</figcaption>
</figure>

![](https://stable-diffusion-art.com/wp-content/uploads/2023/08/image-27.png){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/08/image-26.png){ width=45% }
<figure markdown="span">
  *Слева - OpenPose Full; Справа - DW OpenPose Full*
  <br>
  *DW OpenPose лучше справляется с обнаружением рук и пальцев.*
</figure>

### Tile resample

Модель Tile resample используется для добавления деталей к изображению. Часто используется с апскейлером для одновременного увеличения изображения.

См. метод [ControlNet Tile Upscaling](https://stable-diffusion-art.com/controlnet-upscale/).

### Reference

**Reference** - это набор препроцессоров, которые позволяют генерировать изображения, похожие на референсное изображение. Модель Stable Diffusion и промпт по-прежнему будут влиять на изображения.

Препроцессоры Reference **НЕ** используют отдельную модель. Вам нужно только выбрать препроцессор. (После выбора препроцессора reference выпадающее меню модели будет скрыто.)

Есть 3 препроцессора reference.

 1. [Reference adain](https://github.com/Mikubill/sd-webui-controlnet/discussions/1280): Перенос стиля через **Ada**ptive **I**nstance **N**ormalization. ([статья](https://arxiv.org/abs/1703.06868))
 2. [Reference only](https://github.com/Mikubill/sd-webui-controlnet/discussions/1236): Прямая связь референсного изображения с attention-слоями.
 3. **Reference adain+attn**: Комбинация вышеперечисленного.

Вы можете использовать любой из этих препроцессоров.

Пример ниже.

<figure markdown="span">
  ![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/3aa0c93deb7a.png)
  <figcaption>Референсное изображение (Ввод).</figcaption>
</figure>

Используем CLIP interrogator для составления промпта.

```
a woman with pink hair and a robot suit on, with a sci – fi, Artgerm, cyberpunk style, cyberpunk art, retrofuturism
```
```
disfigured, ugly, bad, immature
```
Модель: Protogen v2.2

#### Reference adain

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/grid_refa-1200x800.png)

#### Reference only

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/grid_refonly-1200x800.png)

#### Reference adain+attn

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/grid_refaa-1200x800.png)

Если бы вы спросили меня, я бы сказал, что reference-only работает лучше всего.

Все изображения выше получены в режиме **balance**. Я не вижу большой разницы при изменении параметра **style fidelity**.

### Image Prompt adapter (IP-adapter)

Image Prompt adapter (IP-adapter) - это модель ControlNet, которая позволяет использовать изображение в качестве промпта. Подробности можно найти в статье [IP-Adapter: Text Compatible Image Prompt Adapter for Text-to-Image Diffusion Models](https://arxiv.org/abs/2308.06721) авторства He Ye и соавторов, а также на их [странице Github](https://github.com/tencent-ailab/IP-Adapter).

![](https://stable-diffusion-art.com/wp-content/uploads/2023/10/image-79-1536x795.png)

#### Установка IP-adapter моделей

Перед использованием IP адаптеров в ControlNet загрузите IP-adapter модели для v1.5.

* [ip-adapter_sd15.pth](https://huggingface.co/lllyasviel/sd_control_collection/blob/main/ip-adapter_sd15.pth)
* [ip-adapter_sd15_plus.pth](https://huggingface.co/lllyasviel/sd_control_collection/blob/main/ip-adapter_sd15_plus.pth)

Поместите их в папку моделей ControlNet.

```
stable-diffusion-webui > extensions > sd-webui-controlnet > models
```

#### Использование IP-adapter

IP-adapter позволяет использовать изображение в качестве промпта, поэтому вам нужно будет предоставить референсное изображение. Давайте используем следующее изображение.

<figure markdown="span">
  ![](https://stable-diffusion-art.com/wp-content/uploads/2023/10/jovan-vasiljevic-Oo2lH6rGUpA-unsplash-200x300.jpg)
  <figcaption>Референсное изображение</figcaption>
</figure>

Сперва загрузите данное изображение в разделе ControlNet.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/10/image-80.png)

Вот остальные настройки ControlNet для использования IP-adapter

* **Enable**: Да
* **Pixel Perfect**: Да
* **Control Type**: IP-Adapter
* **Preprocessor**: ip-adapter_clip_sd15
* **Model**: ip-adapter_sd15

Ниже приведены изображения с IP-адаптерами и без них.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/10/image-82.png){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/10/image-81.png){ width=45% }

<figure markdown="span">
  *Слева - без IP-адаптера; Справа - с IP-адаптером SD1.5*
</figure>

Обратите внимание, как особенности референсного изображения, такие как цветы и более темные цвета, переносятся на сгенерированное изображение!

Модель IP-Adapter SD 1.5 Plus делает нечто похожее, но оказывает более сильный эффект.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/10/image-82.png){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/10/image-83.png){ width=45% }

<figure markdown="span">
  *Слева - без IP-адаптера; Справа - с IP-адаптером SD1.5 Plus*
</figure>

**Модель SD1.5 Plus очень сильная.** Она почти копирует референсное изображение. Вы можете уменьшить **Control Weight**, чтобы ослабить эффект.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/10/image-83.png){ width=30% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/10/Plus-0.5-10655-1415367006-analog-style-eye-focus-highest-quality-highly-detailed-skin-photo-of-a-exquisitely-beautiful-pale-skin-punk-Dutch-girl-21.png){ width=30% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/10/Plus-0.2-10659-1415367006-analog-style-eye-focus-highest-quality-highly-detailed-skin-photo-of-a-exquisitely-beautiful-pale-skin-punk-Dutch-girl-21.png){ width=30% }

<figure markdown="span">
  **Слева** - Control Wight: 1; **По центру** - Control Wight: 0.5; **Справа** - Control Wight: 0.2
</figure>

### Canny

[Детектор краев Canny](https://en.wikipedia.org/wiki/Canny_edge_detector) - это очень старый универсальный детектор краев. Он извлекает контуры изображения. Он полезен для сохранения композиции исходного изображения.

Выберите **canny** как в меню **Preprocessor**, так и в меню **Model**, чтобы его использовать.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/3aa0c93deb7a.png){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-105.png){ width=45% }

Сгенерированные изображения будут следовать контурам.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-107.png){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-106.png){ width=45% }

### Depth

Препроцессор depth **пытается угадать** информацию о глубине на основе референсного изображения.

* **Depth Midas**: Классический оценщик глубины. Также используется в официальной модели [depth-to-image](https://stable-diffusion-art.com/depth-to-image/) v2.
* **Depth Leres**: Больше деталей, но также склонен к отрисовке фона.
* **Depth Leres++**: Еще больше деталей.
* **Zoe**: Уровень детализации между Midas и Leres.
* **Depth Anything**: Более новая и улучшенная модель глубины.
* **Depth Hand Refiner**: Для исправления рук при inpainting.

Референсное изображение:

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/3aa0c93deb7a.png)

Карты глубины:

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-109.png){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-110.png){ width=45% }

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-111.png){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-112.png){ width=45% }

<figure markdown="span">
  **Сверху слева** - Midas; **Сверху справа** - Leres
  <br>
  **Снизу слева** - Leres++; **Снизу справа** - Zoe
</figure>

Промпт и негативный промпт:
```
a woman retrofuturism
```

```
disfigured, ugly, bad, immature
```

Вы можете видеть, что сгенерированное изображение следует карте глубины (Zoe).

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-113.png){ width=100% }
<figure markdown="span">
  *Text-to-image с использованием Zoe.*
</figure>

Сравните с более детализированным Leres++:

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-114.png){ width=100% }
<figure markdown="span">
  *Text-to-image с использованием Depth Leres.*
</figure>

### Line Art

Line Art отрисовывает контур изображения. Он пытается преобразовать его в простой рисунок.

Есть несколько препроцессоров line art.

* **Line art anime**: Линии в стиле аниме
* **Line art anime denoise**: Линии в стиле аниме с меньшим количеством деталей.
* **Line art realistic**: Реалистичные линии.
* **Line art coarse**: Реалистичные более толстые линии.

Используйте с **lineart** моделью.

Изображения ниже сгенерированы с параметром Control Weight, установленным на 0.7.

#### Line Art Anime

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-115.png){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-116.png){ width=45% }

#### Line Art Anime Denoise

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-117.png){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-118.png){ width=45% }

#### Line Art Realistic

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-121.png){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-122.png){ width=45% }

#### Line Art Coarse

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-119.png){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-120.png){ width=45% }

### MLSD

[M-LSD](https://github.com/navervision/mlsd) (Mobile Line Segment Detection) - это детектор прямых линий. Он полезен для извлечения контуров с прямыми краями, такими как дизайн интерьера, здания, уличные сцены, рамки для картин и края бумаги.

Кривые будут проигнорированы.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-124.png){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-125.png){ width=45% }

### Normal maps

**Карта нормалей** указывает ориентацию поверхности. Для ControlNet это изображение, которое указывает направление поверхности в каждом пикселе. Вместо значений цвета пиксели изображения представляют направление, в котором обращена поверхность.

Использование карт нормалей аналогично картам глубины. Они используются для передачи 3D-композиции референсного изображения.

Препроцессоры карт нормалей:

* **Normal Midas**: Оценка карты нормалей из карты глубины [Midas](https://github.com/isl-org/MiDaS).
* **Normal Bae**: Оценка карты нормалей с использованием [метода неопределенности нормалей](https://github.com/baegwangbin/surface_normal_uncertainty), названная в честь автора (Gwangbin Bae).

#### Normal Midas

Подобно карте глубины Midas, карта нормалей Midas хороша для отделения основного объекта от фона.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-127.png){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-128.png){ width=45% }

#### Normal Bae

Карта нормалей Bae, как правило, отображает детали как на переднем, так и на заднем плане.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-129.png){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-130.png){ width=45% }

### Scribbles

Препроцессоры Scribble превращают изображение в каракули, похожие на нарисованные от руки.

* **Scribble HED**: [Holistically-Nested Edge Detection](https://arxiv.org/abs/1504.06375) (HED) - это детектор краев, хорошо подходящий для создания контуров, похожих на нарисованные человеком. По словам авторов ControlNet, HED подходит для перекрашивания и изменения стиля изображения.
* **Scribble Pidinet**: [Pixel Difference network](https://github.com/zhuoinoulu/pidinet) (Pidinet) обнаруживает кривые и прямые края. Ее результат похож на HED, но обычно дает более чистые линии с меньшим количеством деталей.
* **Scribble xdog**: [E**X**tended **D**ifference **o**f **G**aussian](https://users.cs.northwestern.edu/~sco590/winnemoeller-cag2012.pdf) (XDoG) - ещё один метод обнаружения краев. Важно настроить **порог (threshold) xDoG** и наблюдать за результатом работы препроцессора.

Все эти препроцессоры должны использоваться с моделью управления **scribble**.

#### Scribble HED

HED создает грубые линии каракулей.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-135.png){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-136.png){ width=45% }

#### Scribble Pidinet

Pidinet, как правило, создает грубые линии с небольшим количеством деталей. Он хорош для копирования общего контура без мелких деталей.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-133.png){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-134.png){ width=45% }

#### Scribble xDoG

Уровень детализации регулируется настройкой **порога XDoG**, что делает xDoG универсальным препроцессором для создания каракулей.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-132.png){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-131.png){ width=45% }

### Segmentation

Препроцессоры сегментации помечают, какие **объекты** находятся на референсном изображении.

Ниже показан препроцессор сегментации в действии.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/jezael-melgoza-KbR06h9dNQw-unsplash.jpg){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-137.png){ width=45% }

Здания, небо, деревья, люди и тротуары помечены разными предопределенными цветами.

Вы можете найти категории объектов и цвета в [цветовой карте здесь](https://docs.google.com/spreadsheets/d/1se8YEtb2detS7OuPE86fXGyD269pMycAWe2mtKUj2W8/edit#gid=0) для **ufade20k** и **ofade20k**.

Есть несколько вариантов сегментации:

* **ufade20k**: [Сегментация UniFormer](https://github.com/Sense-X/UniFormer) (uf), обученная на наборе данных [ADE20K](https://groups.csail.mit.edu/vision/datasets/ADE20K/).
* **ofade20k**: [Сегментация OneFormer](https://github.com/SHI-Labs/OneFormer) (of), обученная на наборе данных ADE20k.
* **ofcoco**: Сегментация OnFormer, обученная на наборе данных [COCO](https://cocodataset.org/).

Обратите внимание, что цветовые карты сегментаций ADE20k и COCO различаются.

Вы можете использовать препроцессоры сегментации для переноса расположения и формы объектов.

Ниже приведены результаты использования этих препроцессоров с одинаковым промптом и сидом.

```
Futuristic city, tree, buildings, cyberpunk
```

#### UniFormer ADE20k (ufade20k)

Uniformer точно размечает все в этом примере.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-140.png){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-141.png){ width=45% }

#### OneFormer ADE20k (ofade20k)

OneFormer в данном случае немного более зашумлен, но это не влияет на конечное изображение.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-142.png){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-143.png){ width=45% }

#### OneFormer COCO (ofcoco)

OneFormer COCO работает аналогично, с некоторыми ошибками в маркировке.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-138.png){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-139.png){ width=45% }

Сегментация - мощная техника. Вы можете манипулировать картой сегментации, чтобы размещать объекты в конкретных местах. Используйте [цветовую карту](https://docs.google.com/spreadsheets/d/1se8YEtb2detS7OuPE86fXGyD269pMycAWe2mtKUj2W8/edit#gid=0) для ADE20k.

### Shuffle

Препроцессор **Shuffle** перемешивает входное изображение. Давайте посмотрим на Shuffle в действии.

Вместе с ControlNet-моделью Shuffle, препроцессор Shuffle можно использовать для переноса **цветовой схемы** референсного изображения.

Входное изображение:

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/jezael-melgoza-KbR06h9dNQw-unsplash.jpg)

Препроцессор **Shuffle**:

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-144.png)

В отличие от других препроцессоров, препроцессор Shuffle рандомизирован. На него будет влиять выбранное значение сида.

Используйте препроцессор Shuffle с ControlNet-моделью Shuffle. ControlNet-модель Shuffle можно использовать с препроцессором Shuffle или без него.

Изображение ниже получено с помощью препроцессора ControlNet Shuffle и модели Shuffle (тот же промпт, что и в прошлой секции). Цветовая схема примерно соответствует референсному изображению.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-145.png)

Изображение ниже получено только с моделью ControlNet Shuffle (Препроцессор: None). Композиция изображения ближе к оригиналу, но цветовая схема перемешана.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-146.png)

Для сравнения, изображение ниже получено с тем же промптом без ControlNet. Цветовая схема кардинально отличается.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-147.png)

### Color grid T2I adapter

Препроцессор Color grid T2i adapter уменьшает референсное изображение в 64 раза, а затем расширяет его обратно до исходного размера. Итоговый эффект - сетка с усреднёнными цветами в виде заплаток.

Исходное референсное изображение:

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/jezael-melgoza-KbR06h9dNQw-unsplash.jpg)

Предобработано с помощью t2ia_color_grid:

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-151.png)

Затем предобработанное изображение можно использовать с ControlNet-моделью T2I color adapter (t2iadapter_color).

Генерация изображения будет примерно следовать цветовой схеме пространственно.

```
A modern living room
```

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-152.png)

Увеличьте вес ControlNet, чтобы он следовал более точно.

Вы также можете использовать препроцессор None для этой T2I модели.

На мой взгляд, это довольно похоже на [image-to-image](https://stable-diffusion-art.com/how-to-use-img2img-to-turn-an-amateur-drawing-to-professional-with-stable-diffusion-image-to-image/) (img2img).

### Clip vision style T2I adapter

**t2ia_style_clipvision** преобразует референсное изображение в эмбеддинг CLIP vision. Этот эмбеддинг содержит информацию о содержании и стиле изображения.

Вам нужно будет использовать модель управления **t2iadapter_style_XXXX**.

Посмотрите на этот удивительный перенос стиля в действии:

Референсное изображение:

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/3aa0c93deb7a.png)

T2I adapter – CLIP vision:

```
sci-fi girl
```

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-153.png){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-154.png){ width=45% }

Ниже то, что этот промпт сгенерирует, если вы отключите ControlNet.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-155-1200x800.png)

Функция довольно схожа с [Reference ControlNet](https://stable-diffusion-art.com/controlnet/#Reference), но я бы оценил T2IA CLIP vision выше.

### ControlNet Inpainting

ControlNet inpainting позволяет использовать высокий денойз (denoising strength) при [инпеинте](https://stable-diffusion-art.com/inpainting_basics/) для генерации множества вариаций изображения без нарушения общей согласованности.

Например, я использовал промпт для [реалистичных людей](https://stable-diffusion-art.com/realistic-people/).

Модель: [HenmixReal v4](https://civitai.com/models/20282)

```
photo of young woman, highlight hair, sitting outside restaurant, wearing dress, rim lighting, studio lighting, looking at the camera, dslr, ultra quality, sharp focus, tack sharp, dof, film grain, Fujifilm XT3, crystal clear, 8K UHD, highly detailed glossy eyes, high detailed skin, skin pores
```

Негативный промпт
```
disfigured, ugly, bad, immature, cartoon, anime, 3d, painting, b&w
```

У меня есть такая картинка, и я хочу поменять лицо при помощи [инпеинта](https://stable-diffusion-art.com/inpainting_basics/).
![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-171.png)

Если я буду инпейнтить лицо с высоким денойзом (> 0.4), результат, вероятно, будет глобально несогласованным. Ниже приведены изображения после инпеинта с денойзом выставленным в 1.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-176.png)

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-175.png)

ControlNet Inpainting - это то, что вам нужно.

**Чтобы использовать ControlNet inpainting**:

1. Лучше всего использовать ту же модель, на которой было сгенерировано изображение. После генерации изображения на странице **txt2img** нажмите **Send to Inpaint**, чтобы отправить изображение на вкладку **Inpaint** на странице **Img2img**.

2. Используйте кисть, чтобы создать маску над областью, которую вы хотите перегенерировать. Если вы не знакомы с инпеинтом, то см. [руководство для начинающих по инпеинту](https://stable-diffusion-art.com/inpainting_basics/).
  ![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-170.png)

3. Установите **Inpaint area** в **Only masked**. (**Whole picture** также будет работать)

4. Установите силу денойза в 1. (Обычно вы не будете устанавливать ее так высоко без ControlNet.)

5. Установите следующие параметры в разделе **ControlNet**. Вам не нужно загружать референсное изображение.  
  **Enable: Да**  
  **Preprocessor: Inpaint_global_harmonious**  
  **Model: control_v11p_sd15_inpaint**  
  ![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-172.png)  

6. Нажмите **Generate**, чтобы начать инпейнтинг.

Теперь я получаю новые лица, согласованные с глобальным изображением, даже при максимальном денойзе (1)!

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-173.png)

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-174.png)

В настоящее время есть 3 препроцессора для инпеинта:

* **Inpaint_global_harmonious**: Улучшает глобальную согласованность и позволяет использовать высокий денойз.
* **Inpaint_only**: Не изменяет немаскированную область. Он аналогичен Inpaint_global_harmonious в AUTOMATIC1111.
* **Inpaint_only+lama**: Обрабатывает изображение моделью [lama](https://github.com/advimman/lama). Как правило, дает более чистые результаты и хорошо подходит для удаления объектов.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/07/nathan-dumlao-0FAkmy9d3Jg-unsplash.jpg){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/07/image-102.png){ width=45% }

<figure markdown="span">
  Слева - Исходное изображение; Справа - inpaint+lama<br>
  Модель Inpaint+lama для удаления объектов. Был использован пустой промпт.
</figure>

## Копирование лиц с помощью ControlNet

Вы можете использовать специальную модель IP-adapter face для генерации согласованных лиц на нескольких изображениях.

### Установка модели IP-adapter plus face

1. Убедитесь, что ваш [A1111 WebUI](https://stable-diffusion-art.com/automatic1111/) и расширение [ControlNet](https://stable-diffusion-art.com/controlnet/) обновлены.

2. Загрузите [ip-adapter-plus-face_sd15.bin](https://huggingface.co/h94/IP-Adapter/blob/main/models/ip-adapter-plus-face_sd15.bin) и поместите файл в **stable-diffusion-webui > models > ControlNet**.

3. Переименуйте расширение файла с **.bin** на **.pth**. (т.е. имя файла должно быть ip-adapter-plus-face_sd15.pth)

### Использование модели IP-adapter plus face

Чтобы использовать модель IP adapter face для копирования лица, перейдите в раздел ControlNet и загрузите изображение головы.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/11/image.png)

Важные настройки:

* **Enable**: Да
* **Preprocessor**: ip-adapter_clip_sd15
* **Model**: ip-adapter-plus-face_sd15

Control weight должен быть около 1. Вы можете использовать несколько IP-адаптеров для лица ControlNets одновременно. Обязательно отрегулируйте Control weights соответствующим образом, чтобы их сумма составляла 1.

Промпт:
```
A woman sitting outside of a restaurant in casual dress
```

Негативный промпт:
```
ugly, deformed, nsfw, disfigured
```

Что вы получите:
![](https://stable-diffusion-art.com/wp-content/uploads/2023/11/image-1.png)

<figure markdown="span">
  *Согласованное лицо с несколькими IP-адаптерами.*
</figure>

## Объяснение ВСЕХ настроек ControlNet

Когда впервые используешь ControlNet, можно немного испугаться от количества настроек! Но давай-ка пройдемся по ним не спеша, разберем на пальцах.

Будет глубокое погружение в тему. Если думаешь, что тебе нужен перерыв, то сделай его сейчас...

### Входное изображение

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-156.png)

**Холст с изображением**: Сюда можно перетащить картинку. Или кликнуть по холсту и выбрать файл через браузер. **Входное изображение будет обработано выбранным препроцессором из выпадающего меню Preprocessor**. На выходе получится карта управления (control map).

**Иконка с карандашом**: Создает новый белый холст вместо загрузки референсного изображения. Для рисования набросков прям на нем.

**Иконка с камерой**: Делает фото с твоей камеры и использует ее как входное изображение. Нужно будет дать браузеру доступ к камере.

### Выбор модели

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-157.png)

**Enable**: Включает/выключает ControlNet.

**Low VRAM**: Для видеокарт с меньше 8 гигамбайт памяти. Экспериментальная фича. Включай, если не хватает видеопамяти или если хочешь увеличить количество обрабатываемых картинок.

**Allow Preview**: Включает окно превью рядом с референсным изображением. Я бы советовал включить. Нажми на **значок взрыва** рядом с меню Preprocessor, чтобы увидеть, как работает препроцессор.

**Preprocessor**: Препроцессор (в исследовательской статье его называют аннотатором) для обработки входного изображения - определения краев, глубины, карт нормалей и т.д. **None** использует входную картинку как есть, без обработки.

**Model**: Модель ControlNet. Если выбрал препроцессор, обычно выбирают соответствующую ему модель. Модель ControlNet будет использована совместе с моделью Stable Diffusion, выбранной вверху интерфейса AUTOMATIC1111.

### Control Weight

Под меню с препроцессором и моделью находятся три слайдера для настройки силы эффекта: **Control Weight**, **Starting** и **Ending Control Steps**.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-158.png)

Я буду использовать вот эту картинку, чтобы показать влияние параметра **Control Weight**. На ней девушка сидит.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/01976-1737435102-full-body-a-young-female-highlights-in-hair-sitting-outside-restaurant-blue-eyes-wearing-a-dress-side-light.png)

Но в промпте я попрошу сгенеровать **стоящую девушку**.
> full body, a young female, highlights in hair, **standing** outside restaurant, blue eyes, wearing a dress, side light

**Weight**: Насколько сильно карта управления влияет на результат по сравнению с текстовым промптом. Похоже на [вес ключевых слов](https://stable-diffusion-art.com/prompt-guide/#Keyword_weight) в промпте, но применяется к карте управления.

Следующие картинки сгенерены с препроцессором OpenPose и соответствующей моделью.


![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/weight-1-07221-2444253981-full-body-a-young-female-highlights-in-hair-standing-outside-restaurant-blue-eyes-wearing-a-dress-side-light.png){ width=22% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/weight-0.5-07221-2444253981-full-body-a-young-female-highlights-in-hair-standing-outside-restaurant-blue-eyes-wearing-a-dress-side-light.png){ width=22% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/weight-0.3-07241-2444253981-full-body-a-young-female-highlights-in-hair-standing-outside-restaurant-blue-eyes-wearing-a-dress-side-light.png){ width=22% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/weight-0.1-07237-2444253981-full-body-a-young-female-highlights-in-hair-standing-outside-restaurant-blue-eyes-wearing-a-dress-side-light.png){ width=22% }

<figure markdown="span">
  *Вес слева направо: 1.0, 0.5, 0.3, 0.1*
</figure>

Как видно, **Control Weight определяет, насколько сильно карта управления влияет на результат относительно промпта**. Чем меньше вес, тем меньше ControlNet требует от картинки следовать карте управления.

**Starting ControlNet step**: Шаг, с которого ControlNet начинает применяться. 0 означает самый первый шаг.

**Ending ControlNet step**: Шаг, на котором ControlNet заканчивает работу. 1 означает последний шаг.

Давайте зафиксируем начальный шаг на 0 и будем менять конечный, посмотрим, что получится.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/weight-1-07221-2444253981-full-body-a-young-female-highlights-in-hair-standing-outside-restaurant-blue-eyes-wearing-a-dress-side-light-1.png){ width=22% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/T-0.3-07253-2444253981-full-body-a-young-female-highlights-in-hair-standing-outside-restaurant-blue-eyes-wearing-a-dress-side-light.png){ width=22% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/T-0.2-07255-2444253981-full-body-a-young-female-highlights-in-hair-standing-outside-restaurant-blue-eyes-wearing-a-dress-side-light.png){ width=22% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/T-0.1-07254-2444253981-full-body-a-young-female-highlights-in-hair-standing-outside-restaurant-blue-eyes-wearing-a-dress-side-light.png){ width=22% }

<figure markdown="span">
  *Ending step cлева направо: 1.0, 0.3, 0.2, 0.1*
</figure>

Поскольку начальные шаги определяют общую композицию ([семплер](https://stable-diffusion-art.com/samplers/) убирает максимум шума на каждом шаге, начиная со случайного тензора в скрытом пространстве), поза задается, даже если применять ControlNet всего на 20% первых шагов семплирования.

В то же время изменение **конечного шага ControlNet** влияет не так сильно, потому что глобальная композиция задается в самом начале.

### Control Mode

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-159.png)

**Balanced**: ControlNet применяется и при [conditioning](https://stable-diffusion-art.com/how-stable-diffusion-work/#Conditioning), и при [unconditioning](https://stable-diffusion-art.com/how-negative-prompt-work/#Sampling_with_negative_prompt) на [этапе семплирования](https://stable-diffusion-art.com/samplers/). Это стандартный режим работы.

**My prompt is more important**: Эффект ControlNet постепенно уменьшается в процессе инъекций в U-Net (их 13 штук на один шаг семплирования). По сути это значит, что ваш промпт влияет сильнее, чем ControlNet.

**ControlNet is more important**: Выключает ControlNet на unconditioning. По факту параметр [CFG scale](https://stable-diffusion-art.com/how-stable-diffusion-work/#What_is_CFG_value) также работает как множитель для эффекта ControlNet.

Не переживай, если не до конца понял, как это работает в деталях. Названия опций точно описывают результат.

### Resize mode

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-160.png)

Resize mode определяет, что делать, когда размер входного изображения или карты управления отличается от размера генерируемых картинок. Можно не заморачиваться с этими настройками, если соотношение сторон одинаковое.

Продемонстрирую эффект режимов ресайза, выставив генерацию горизонтальной картинки при вертикальном входном изображении/карте управления.

**Just Resize**: Независимо масштабирует ширину и высоту карты управления, чтобы вписать ее в холст. Меняет соотношение сторон карты.

Девушке приходится наклониться вперед, чтобы остаться в кадре. С этим режимом можно создавать интересные эффекты.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/just-resize.png){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/just-resize-2.png){ width=45% }

<figure markdown="span">
  ***Just Resize**  вписывает карту управления в холст, масштабируя ее.*
</figure>

**Crop and Resize:** Вписывает холст внутрь карты. Обрезает карту, чтобы она совпадала по размеру с холстом.

Поскольку карта обрезается сверху и снизу, то же происходит и с девушкой.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/img-outter-fit.png){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/outter-fit.png){ width=45% }

<figure markdown="span">
  ***Crop and Resize** вписывает холст в карту и обрезает ее.*
</figure>

**Resize and fill**: Вписывает всю карту в холст. Дополняет карту пустым пространством, чтобы размер совпадал с холстом.

По сравнению с исходным изображением, по бокам добавляется больше пространства.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/scale-to-fit.png){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/img-scale-to-fit-1.png){ width=45% }

<figure markdown="span">
  ***Resize and fill** вписывает всю карту в холст и дополняет ее.*
</figure>

Ну всё, теперь (надеюсь) ты знаешь все настройки. Давай подумаем, как можно использовать ControlNet.

## Несколько ControlNet

Для генерации картинки можно использовать ControlNet несколько раз. Давай разберем на примере.

**Модель**: Protogen v2.2

**Промпт**:
```
An astronaut sitting, alien planet
```


**Негативный промпт**:
```
disfigured, deformed, ugly
```

С таким промптом получаются картинки с разной композицией.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-164-1200x800.png)

Допустим, я хочу независимо контролировать композицию астронавта и фона. Для этого можно использовать несколько (в данном случае 2) ControlNet'а.

Для фиксации позы астронавта я использую вот такой референс.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/sit6.jpg)

Настройки для **ControlNet 0**:

* **Enable**: Да
* **Preprocessor**: OpenPose
* **Model**: control_xxxx_openpose
* **Resize mode**: Resize and Fill (Так как мой исходный референс вертикальный)

Для фона я использую следующий референс.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/peter-crorkan-cvXJlTqTmKI-unsplash-1.jpg)

Модели глубины идеально подходят для этой цели. Вы наверняка захотите поэкспериментировать, какая модель и настройки дадут нужную вам карту глубины.

Настройки для **ControlNet 1**:

* **Enable**: Да
* **Control Weight**: 0.45
* **Preprocessor**: depth_zeo
* **Model**: control_XXXX_depth
* **Resize mode**: Crop and resize

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-166.png)

Теперь я могу независимо контролировать композицию объекта и фона:

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-162.png)

![](https://stable-diffusion-art.com/wp-content/uploads/2023/05/image-163.png)

Советы:

* Поиграйся с весами ControlNet, если какой-то из них не делает свою работу.
* Следи за Resize mode, если размер референсов и финальной картинки не совпадает.

## Несколько идей для использования ControlNet
### Копирование позы
Наверное, самое распространенное применение ControlNet - копирование человеческих поз. Обычно контролировать позы сложно... но теперь это в прошлом! Входным изображением может быть картинка, сгенерированная Stable Diffusion, или фотография с реальной камеры.

#### Модель OpenPose
Чтобы использовать ControlNet для переноса человеческих поз, следуй инструкциям по включению ControlNet в AUTOMATIC1111, описанным выше. Выставь следующие настройки:

* **Enable**: Да
* **Preprocessor**: openpose
* **Model**: control_…._openpose

Вот пара примеров.

#### Пример 1: Копирование позы с картинки
Для начала давай скопируем позу с этой фотографии, где девушка любуется листьями.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/v-m.jpg)

Используя различные модели и промпты, можно полностью изменить изображение, но сохранить позу.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/02002-1194362429-photo-of-a-female-wearing-dress-highlight-in-blonde-hair-outside-restaurant-holding-a-eagle-768x1128.png){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/07437-4015835577-a-man-in-suit-in-living-room-with-a-colorful-bird-on-his-hand.png){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/07458-251752375-photo-of-a-beautiful-and-mysterious-mage-detailed-pretty-face-detailed-clothing-fire-on-hand.png){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/07462-3826108173-photo-of-a-female-highlight-in-hair-outside-city-street-holding-a-dragon-768x1128.png){ width=45% }

<figure markdown="span">
  **Сверху слева** - Модель Dreamlike Photoreal; **Сверху справа** - Модель Anything v3
  <br>
  **Снизу слева** - Модель DreamShaper; **Снизу справа** - Модель Anything v3
</figure>

#### Пример 2: Ремикс сцены из фильма

Можно переделать культовую танцевальную сцену из "Криминального чтива" в йога-сессию в парке.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/image-171.png)

Тут использован ControlNet с моделью [DreamShaper](https://stable-diffusion-art.com/models/#DreamShaper).

**Промпт:**
```
photo of women doing yoga, outside in a park.
```

**Негативный промпт:**
```
disfigured, ugly, bad, immature
```

![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/00019-1330013789-photo-of-women-doing-yoga-outside-in-a-park.png)

Тот же промпт, что и для [модели Inkpunk Diffusion](https://stable-diffusion-art.com/models/#Inkpunk_Diffusion). (Вам нужно будет добавить в промпт фразу **nvinkpunk**):

![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/image-133.png)

### Стилизация изображений с ControlNet
#### Используя промпт
Ниже результаты с моделью v1.5, но с разными **промптами** для достижения разных стилей. Использован ControlNet с разными препроцессорами. Лучше всего поэкспериментировать и посмотреть, что работает лучше.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/07346-1996214137-pixel-art-of-Beethoven.png){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/07339-178736178-A-3D-rendering-of-Beethoven.png){ width=45% }

![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/00062-3265423368-A-black-and-white-photo-of-Beethoven.png){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/watercolor-normal.png){ width=45% }

<figure markdown="span">
  **Сверху слева** - Pixel Art, Canny; **Сверху справа** - 3D rendering, Canny
  <br>
  **Снизу слева** - Black and white, HED; **Снизу справа** - water color, Normal
</figure>

#### Используя модели
Можно также использовать [модели](https://stable-diffusion-art.com/models/) для стилизации изображений. Ниже сгенерированы картинки с промптом "Painting of Beethoven" на моделях [Anythingv3](https://stable-diffusion-art.com/models/#Anything_V3), [DreamShaper](https://stable-diffusion-art.com/models/#DreamShaper) и [OpenJourney](https://stable-diffusion-art.com/models/#Open_Journey).

![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/anythingv3.png){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/dreamshaper-1.png){ width=45% }

![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/07374-2883595273-mdjrny-v4-style-photo-of-Beethoven.png){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/inkpunk.png){ width=45% }

<figure markdown="span">
  **Сверху слева** - Anything v3; **Сверху справа** - DreamShaper
  <br>
  **Снизу слева** - OpenJourney; **Снизу справа** - Inkpunk Diffusion
</figure>

### Контроль поз при помощи Magic Pose
Иногда бывает сложно найти картинку с нужной позой. Можно создать свою позу с помощью таких инструментов, как [Magic Poser](https://webapp.magicposer.com/) ([доп. инфа](https://www.reddit.com/r/StableDiffusion/comments/112t4fl/controlnet_experiments_from_magic_poser_input/)).

**Шаг 1**: Зайди на сайт [Magic Poser](https://webapp.magicposer.com/).

![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/image-136.png){ width=45% }

**Шаг 2**: Подвигай ключевые точки модели, чтобы настроить позу.

**Шаг 3**: Нажми на Preview. Сделай скриншот результата. Должна получиться картинка типа такой:

![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/pose2.jpg)

**Шаг 4**: Используй модель OpenPose в ControlNet. Выбери модель и промпт на свой вкус для генерации картинок.

Ниже несколько картинок, сгенерированных на модели 1.5 и DreamShaper. Поза хорошо скопировалась во всех случаях.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/00110-2768298569-beautiful-wearing-fantastic-hand-dyed-cotton-clothes-embellished-beaded-feather-decorative-fringe-knots-colorful-pigtail-sub.png){ width=30% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/00113-368104786-modelshoot-style-extremely-detailed-CG-unity-8k-wallpaper-full-shot-body-photo-of-the-most-beautiful-artwork-in-the-world-m.png){ width=30% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/00120-2262638220-photorealistic-photo-of-a-handsome-young-male-wizard-white-wizard-shirt-with-golden-trim-white-robe-moving-in-the-wind-long-w.png){ width=30% }


### Идеи для дизайна интерьеров
Можно использовать детектор прямых линий MLSD в Stable Diffusion ControlNet для генерации идей дизайна интерьеров. Вот настройки ControlNet:

* **Preprocessor**: mlsd
* **Model**: mlsd

Начнём с фотографий готовых интерьеров. Возьмем для примера вот эту:

![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/living-room-2732939_640.jpg)

Промпт:
```award winning living room```

**Модель**: Stable Diffusion v1.5

Вот несколько сгенерированных идей дизайна:

![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/00133-475383634-award-winning-living-room.png){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/00129-1768390595-award-winning-living-room.png){ width=45% }

![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/00130-1768390596-award-winning-living-room.png){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/00128-1768390594-award-winning-living-room.png){ width=45% }

Также можно использовать depth-модель. Вместо прямых линий она будет делать упор на сохранение информации о глубине.

* **Preprocessor**: Depth Midas
* **Model**: Depth

Сгенерированные картинки:

![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/00135-3607245534-award-winning-living-room.png){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/00136-3607245535-award-winning-living-room.png){ width=45% }

![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/00137-3607245536-award-winning-living-room.png){ width=45% }
![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/00138-3607245537-award-winning-living-room.png){ width=45% }

## Разница между моделью глубины Stable Diffusion и ControlNet
!!! quote "Примечание от переводчика"
    Модель depth-to-image работает только с Stable Diffusion 2, которая не получила широкого распространения. Так что ценность информации из данного раздела сомнительна.

Stability AI, создатели Stable Diffusion, выпустили модель [depth-to-image](https://stable-diffusion-art.com/depth-to-image/). У нее много общего с ControlNet, но есть и важные различия.

Давай сначала о том, что похоже.

1. Обе модели - это модели Stable Diffusion...
2. Обе используют два [conditions](https://stable-diffusion-art.com/how-stable-diffusion-work/#Conditioning) (результат работы препроцессора для картинки и текстовый промпт).
3. Обе используют [MiDAS](https://github.com/isl-org/MiDaS) для оценки карты глубины.

А вот различия:

1. Модель depth-to-image - это v2 модель. **ControlNet можно использовать с любыми v1 или v2 моделями**. Это важный момент, поскольку v2 модели, как известно, сложнее в использовании. Людям сложно генерировать на них хорошие картинки. То, что ControlNet может использовать **любую** v1 модель, открыло возможность делать conditioning по глубине не только для [базовой модели v1.5](https://stable-diffusion-art.com/models/#Stable_diffusion_v15), но и для тысяч специализированных моделей, выпущенных сообществом.
2. ControlNet более универсальный. Помимо глубины, он может делать условия по границам, позам и всё такое.
3. У ControlNet карта глубины более высокого разрешения, чем у depth-to-image.

## Как работает ControlNet?
Статья будет неполной без объяснения, как ControlNet работает под капотом.

ControlNet "прикрепляет" обучаемые сетевые модули к различным частям [U-Net](https://stable-diffusion-art.com/how-stable-diffusion-work/#Feeding_embeddings_to_noise_predictor) (предсказателя шума) модели Stable Diffusion. Веса модели Stable Diffusion заблокированы, чтобы они не менялись во время обучения. Только прикрепленные модули меняются в процессе тренировки.

Диаграмма модели из [исследовательской статьи](https://arxiv.org/abs/2302.05543) хорошо это иллюстрирует. Изначально веса прикрепленного модуля равны нулю, что позволяет новой модели использовать преимущества обученной и заблокированной модели.

![](https://stable-diffusion-art.com/wp-content/uploads/2023/02/image-139.png)

Во время обучения вместе с каждой тренировочной картинкой подаются [два condition](https://stable-diffusion-art.com/how-stable-diffusion-work/#Conditioning)'а. (1) Текстовый промпт и (2) **карта управления (control map)**, типа ключевых точек OpenPose или границ Canny. ControlNet учится генерировать картинки на основе этих двух входных данных.

Каждая ControlNet-модель обучается независимо.

## Почитать еще
* [Картинки](https://www.reddit.com/r/StableDiffusion/comments/112t4fl/controlnet_experiments_from_magic_poser_input/), сгенерированные при помощи Magic Poser и OpenPose.
* Научная статья: [Adding Conditional Control to Text-to-Image Diffusion Models](https://arxiv.org/abs/2302.05543) (10 февраля 2023)
* [ControlNet v1.0 на Github](https://github.com/lllyasviel/ControlNet)
* [ControlNet v1.1 Файлы моделей (HuggingFace)](https://huggingface.co/lllyasviel/ControlNet-v1-1)
* [ControlNet v1.1 на Github](https://github.com/lllyasviel/ControlNet-v1-1-nightly)
* [ControlNet расширение для AUTOMATIC1111 Web-UI](https://github.com/Mikubill/sd-webui-controlnet)
