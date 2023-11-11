Тег   | Тема
----- | ------
speech   |  Голосовых нейронок тред (TTS, STS, STT) ==#xxxx==

***

Обсуждаем нейросети, связанные с синтезом, преобразованием и распознаванием речи. Не забываем публиковать свои шедевры в треде.

**[B]Text To Speech (TTS) 📝 👉 🎤[/B]**

**[B]Silero[/B]**
Российская разработка, легковесный, быстрый, относительно качественный. Поддерживает много языков, включая русский.
https://github.com/snakers4/silero-models 

Есть 2 GUI:
Для всех систем: https://huggingface.co/spaces/NeuroSenko/tts-silero
Для винды, более продвинутый проект формата "всё в одном" (TTS/STS/TTS), часть функционала платная: SoundWorks, https://dmkilab.com/soundworks

Официальный бот в телеге. Требуется подписка на новостной канал. На бесплатном тарифе есть лимиты на число запросов в сутки: https://t.me/silero_voice_bot

Данная нейронка не обладает высокими системными требованиями. Если хотите запустить на своём компьютере, то, придётся накачать около 5 гигов + питон + гит, но всё будет установленно в одну папку поэтому будет легко удалить если надоест. Если используете несколько нейросетей - используйте Anaconda / Miniconda!
Гайд: https://textbin.net/kfylbjdmz9

Нет возможности тренировки своих голосов, но возможно сделать генерацию с одним из имеющихся голосов, и потом преобразовать получившийся файл через STS (смотри ниже).

**[B]Elevenlabs[/B]**
Онлайн-сервис синтеза и преобразования английского голоса. На бесплатном тарифе ограничения по числу символов в месяц.
Сайт: https://elevenlabs.io/speech-synthesis
Гайд по использованию и общие советы: https://rentry.org/AIVoiceStuff

**[B]VITS-Umamusume-voice-synthesizer[/B]**
Только на японском, 87 голосов.
ХагингФейс: https://huggingface.co/spaces/Plachta/VITS-Umamusume-voice-synthesizer
Гугл-Калаб: https://colab.research.google.com/drive/1J2Vm5dczTF99ckyNLXV0K-hQTxLwEaj5?usp=sharing

**[B]MoeGoe и MoeTTS[/B]**
Гайд на китайском: https://colab.research.google.com/drive/1HDV84t3N-yUEBXN8dDIDSv6CzEJykCLw#scrollTo=EuqAdkaS1BKl
Кажется можно тренировать свои голосовые модели, но это не точно
Гугл-Калаб: https://www.bilibili.com/video/BV16G4y1B7Ey/?share_source=copy_web&vd_source=630b87174c967a898cae3765fba3bfa8


**[B]Speech To Speech (STS) 🎤 👉 🎤[/B]**

Оба проекта SVC и RVC позволяют обучать модели на любой голос, в том числе свой, любимой матушки, обожаемого политика и других представителей социального дна. Для обучения своих моделей нужен датасет от 10 минут до 1 часа. Разработчики софта рекомендуют для обучения использовать видеокарту с объёмом памяти 10 GB VRAM, но возможно обучение и на видеокартах с меньшим объёмом памяти.

Преобразование голоса можно осуществлять как на видеокарте, так и на процессоре с меньшей скоростью.

**[B]SoftVC VITS Singing Voice Conversion Fork (SVC)[/B]**
Репозиторий: https://github.com/voicepaw/so-vits-svc-fork
Гайд по установке и использованию: https://rentry.org/tts_so_vits_svc_fork_for_beginners

Готовые модели:
[S]~~https://discord .gg/aihub (канал voice-models)~~[/S] UPD: сервер выпилили, бекапы здесь: https://www.weights.gg | https://voice-models.com
https://huggingface.co/models?search=so-vits-svc
https://civitai.com/models?query=so-vits-svc
https://t.me/AINetSD_bot (зеркало https://huggingface.co/NeuroSenko/svc-models/tree/main )

Для изменения голоса в песнях вам дополнительно необходимо установить софт для отделения вокала от инструменталки: https://github.com/Anjok07/ultimatevocalremovergui

Не поддерживает AMD GPU на Windows.

**[B]Retrieval-based-Voice-Conversion-WebUI (RVC)[/B]**
Репозиторий: https://github.com/RVC-Project/Retrieval-based-Voice-Conversion-WebUI
Где взять последнюю версию: https://github.com/RVC-Project/Retrieval-based-Voice-Conversion-WebUI/releases

Готовые модели:
[S]~~https://discord .gg/aihub (канал voice-models)~~[/S] UPD: сервер выпилили, бекапы здесь: https://www.weights.gg | https://voice-models.com
https://huggingface.co/juuxn/RVCModels/tree/main
https://t.me/AINetSD_bot (зеркало https://huggingface.co/NeuroSenko/rvc-models/tree/main )

Утилиты для отделения вокала от инструменталки идут в комплекте.


**[B]Speech To Text (STT) 🎤 👉 📝[/B]**

Консольная тулза от OpenAI, поддерживает множество языков, включая русский: https://github.com/openai/whisper

**[B]Прочее 🛠️[/B]**
Утилита для нарезки длинных аудиотреков (пригодится для составления датасетов): https://github.com/flutydeer/audio-slicer
Чтобы создать видео из аудио, можно использовать FFMPEG, но если лень - есть GUI, SoundWorks (ссылку см. выше) - Tools \ Video \ Produce still video
Загрузить аудиофайл, чтобы поделиться в треде: https://vocaroo.com/upload

Ссылки на эти проекты мелькали в прошлых тредах, но не похоже на то, чтобы их активно использовали итт:
https://github.com/w-okada/voice-changer/blob/master/README_en.md
https://themetavoice.xyz/
https://github.com/coqui-ai/TTS

Шаблон для переката: https://rentry.co/byv2s
Предыдущий тред: ==>>==