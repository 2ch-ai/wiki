# Инструменты для работы с голосом

Если заголовок выглядит как ссылка, значит, по данной системе в вики существует отдельная статья.

## Синтез голоса из текста (TTS)
У TTS-систем отсутствует возможность тренировки своих голосов, однако, вы можете сделать генерацию с одним из имеющихся голосов, и потом преобразовать получившийся файл через STS (смотри ниже).

### С поддержкой русского языка

<div class="grid cards" markdown>

-   [__SileroTTS__](./tts/silero.md)

    ---

    Оффлайн-проект синтеза голоса от русскоязычной команды Silero.
    
    Так же доступен через официальный Telegram бот, но с лимитами.

    [[Открыть сайт]](https://silero.ai/tag/text-to-speech/) | [[Github]](https://github.com/snakers4/silero-models) | [[Бот в телеге]](t.me/silero_voice_bot)

-   __TeraTTS__

    ---

    Ещё один Open Source проект TTS от русскоязычных разработчиков.
    
    Можно поставить локально, либо использовать официальный бот в телеграме или huggingface.

    [[Github]](https://github.com/Tera2Space/TeraTTS) | [[Huggingface]](https://huggingface.co/spaces/TeraTTS/TTS) | [[Бот в телеге]](https://t.me/teratts_bot) 

-   __PiperTTS__

    ---

    Локальный TTS, оптимизированный для Raspberry Pi 4.

    [[Github]](https://github.com/rhasspy/piper)

-   [__XTTS__](./tts/xtts.md)

    ---

    Локальный TTS, позволяющий клонировать голос на основании 6-секундной записи.
    
    [[Github]](https://github.com/coqui-ai/TTS) | [[Доп. инфа на huggingface]](https://huggingface.co/coqui/XTTS-v2)

-   [__EdgeTTS__](./tts/edge.md)

    ---

    Бесплатная, не требующая СМС и регистраций онлайн-система синтеза голоса от Microsoft.

    Предоставляется в виде python-пакета и доступна в виде CLI.

    [[Python-пакет]](https://pypi.org/project/edge-tts/)

</div>

### Для прочих языков

<div class="grid cards" markdown>

-   [__VITS-Umamusume-voice-synthesize__](./tts/vits-umamusume-voice-synthesize.md)

    ---

    Оффлайн-система с поддержкой английского, китайского и японского языков.
    
-   [__MoeGoe и MoeTTS__](./tts/moe.md)

    ---

    Хобби-проект какого-то китайца по TTS для японского языка.
</div>


## Преобразование голоса (STS)

### Нейрокаверы
Оба проекта RVC и SVC позволяют обучать модели на любой голос, в том числе свой, любимой матушки, обожаемого политика и других представителей социального дна.

Для обучения своих моделей нужен датасет от 10 минут до 1 часа. Разработчики софта рекомендуют для обучения использовать видеокарту с объёмом памяти 10 GB VRAM, но возможно обучение и на видеокартах с меньшим объёмом памяти.

Преобразование голоса можно осуществлять как на видеокарте, так и на процессоре с меньшей скоростью.

Кроме того, оба проекта включают в себя инструменты для преобразования голоса в реальном времени.

<div class="grid cards" markdown>

-   [__RVC__](./sts/rvc/rvc.md)

    ---

    Более новая оффлайн-система для преобразования голоса. Доступно огромное количество готовых моделей.

-   [__SVC__](./sts/svc/svc.md)

    ---

    Старая оффлайн-система для преобразования голоса.
    
    Отличается сильным акцентом и более длительным временем обучения. Количество готовых моделей для неё на порядки ниже, чем для RVC.

    Вместо данной системы советую использовать RVC.
</div>

### Изменение голоса в реальном времени

<div class="grid cards" markdown>

-   __w-okada/voice-changer__

    ---

    Локальная система для изменения голоса в реальном времени.

    [[Github]](https://github.com/w-okada/voice-changer/blob/master/README_en.md) | [[Гайд]](https://github.com/MaHivka/ultimate-voice-models-FAQ/wiki/Voice%E2%80%90Changer) | [[Другой гайд]](https://github.com/MaHivka/ultimate-voice-models-FAQ/wiki/Voice%E2%80%90Changer%E2%80%90%D0%9F%D0%B5%D1%80%D0%B5%D0%B2%D0%BE%D0%B4) | [[FAQ]](https://github.com/MaHivka/ultimate-voice-models-FAQ/wiki/Voice%E2%80%90Changer%E2%80%90FAQ)

-   __MetaVoice__

    ---

    Проприетарный проект для изменения голоса в реальном времени.

    [[Открыть сайт]](https://themetavoice.xyz/)
</div>

## Распознавание речи (STT)

<div class="grid cards" markdown>

-   __Whisper__

    ---

    Консольная тулза от OpenAI, работает полностью в оффлайне. Поддерживает множество языков, включая русский.

    [[Github]](https://github.com/openai/whisper)

-   __SileroSTT__

    ---

    Оффлайн-система распознавания голоса от русскоязычной команды Silero.

    [[Открыть сайт]](https://silero.ai/tag/our-speech-to-text/) | [[Github]](https://github.com/snakers4/silero-models) | [[Бот в телеге]](https://t.me/silero_audio_bot)

-   __Tinkoff VoiceKit__

    ---

    Платное распознавание речи от Tinkoff.

    [[Открыть сайт]](https://www.tinkoff.ru/software/voicekit/) | [[Тарифы]](https://cloud.yandex.ru/docs/speechkit/pricing)

-   __Yandex SpeechKit__

    ---

    Платное распознавание речи от Yandex.

    [[Открыть сайт]](https://cloud.yandex.ru/services/speechkit)

-   __SaluteSpeech (Sber)__

    ---

    Распознавание речи от Сбера, есть бесплатный тариф с лимитами.

    [[Открыть сайт]](https://developers.sber.ru/portal/products/smartspeech) | [[Тарифы]](https://developers.sber.ru/portal/products/smartspeech#tariff)

</div>

## Разделение вокала и инстументалки

<div class="grid cards" markdown>

-   __Ultimate Vocal Remover GUI__

    ---

    Оффлайн-система для извлечения вокала и музыки из аудиофайлов.
    
    Поддерживает множество различных архитектур нейросетей для данной задачи и позволяет скачивать новые модели через сам интерфейс.

    [[Github]](https://github.com/Anjok07/ultimatevocalremovergui) | [[Релизы]](https://github.com/Anjok07/ultimatevocalremovergui/releases) | [[Гайд]](https://github.com/MaHivka/ultimate-voice-models-FAQ/wiki/UVR)

-   __vocalremover.org__

    ---

    Бесплатная онлайн-система для разделения трека на вокал и инструменталку.

    [[Открыть сайт]](https://vocalremover.org/)

</div>


## TTS -> STS конвееры
<div class="grid cards" markdown>

-   __daswer123/silero-rvc-tts-ru-gui__

    ---

    Комбинация технологии silero-tts и rvc для создания любого голоса для tts.

    [[Github]](https://github.com/daswer123/silero-rvc-tts-ru-gui)

-   __daswer123/RVC-telegram-bot__

    ---

    Проект многофункционального телеграм-бота, комбинирующего в себе возможности TTS, STS, разделения трека на составляющие через Demucs и прочее.

    Возможность автоматически создавать AI каверы, достаточно отправить песню или сылку на ютуб.

    [[Github]](https://github.com/daswer123/RVC-telegram-bot) | [[Бот в Telegram]](https://t.me/mister_parodist_rvc_bot)

</div>

## Проприетарные системы

<div class="grid cards" markdown>

-   __Chirp__

    ---

    AI генератор композиций прямо из текста. На бесплатном тарифе есть лимиты.

    Где доступна генерация:  
    [[Сайт]](https://app.suno.ai/) | [[Discord]](https://suno.ai/discord)

-   __HeyGen__

    ---

    Онлайн-сервис, позволяющий переводить видео на разные языки с сохранением оригинального голоса и синхронизацией движения губ на видеопотоке. Так же доступны функции TTS и ещё что-то.
    
    На бесплатном тарифе есть лимиты.

    [[Открыть сайт]](https://www.heygen.com/)

-   __Elevenlabs__

    ---

    Онлайн-сервис синтеза и преобразования голоса.
    
    Доступна только по оплате картой. Жители этой страны без зарубежной карты в пролёте.

    [[Открыть сайт]](https://elevenlabs.io/speech-synthesis) [[Старый гайд]](https://rentry.org/AIVoiceStuff)
</div>

## Утилиты

<div class="grid cards" markdown>

-   __ffmpeg__

    ---

    Набор консольных утилит для манипуляций с media-контентом.

    [[Страница загрузки]](https://ffmpeg.org/download.html)

-   __Audacity__

    ---

    Бесплатный кроссплатформенный UI для работы с аудио-файлами.

    [[Страница загрузки]](https://ffmpeg.org/download.html)

-   __vocaroo__

    ---

    Загрузить аудиофайл, чтобы поделиться в треде.

    [[Открыть сайт]](https://vocaroo.com/upload)

</div>

## Дополнительные ссылки
* [Каталог речевых технологий для русского языка](https://github.com/alphacep/awesome-russian-speech)
* [Русскоязычая вики по RVC/UVR/Voice-Changer](https://github.com/MaHivka/ultimate-voice-models-FAQ/wiki)
* [Англоязычная вики по голосовым моделям](https://docs.aihub.wtf/)