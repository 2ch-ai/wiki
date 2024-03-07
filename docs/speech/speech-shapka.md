Тег   | Тема
----- | ------
speech   |  Голосовых нейронок тред (TTS, STS, STT) ==#xxxx==

***

Обсуждаем нейросети, связанные с синтезом, преобразованием и распознаванием речи. Не забываем публиковать свои шедевры в треде.

Прошлый тред: ==>>==  

Вики треда: <https://2ch-ai.gitgud.site/wiki/speech/>

**[B]FAQ[/B]**

**[B]Q: Хочу озвучивать пасты с двача голосом Путина/Неко-Арк/и т.п.[/B]**

1\. Используешь любой инструмент для синтеза голоса из текста - есть локальные, есть онлайн через huggingface или в виде ботов в телеге:  
<https://2ch-ai.gitgud.site/wiki/speech/#синтез-голоса-из-текста-tts>

Спейс без лимитов для EdgeTTS:  
<https://huggingface.co/spaces/NeuroSenko/rus-edge-tts-webui>

Так же можно использовать проприетарный комбайн Soundworks (часть фич платная):  
<https://dmkilab.com/soundworks>

2\. Перегоняешь голос в нужный тебе через RVC. Для него есть огромное число готовых голосов, можно обучать свои модели:  
<https://2ch-ai.gitgud.site/wiki/speech/sts/rvc/rvc/>

**[B]Q: Как делать нейрокаверы?[/B]**

1\. Делишь оригинальную дорожку на вокал и музыку при помощи Ultimate Vocal Remover:  
<https://github.com/MaHivka/ultimate-voice-models-FAQ/wiki/UVR>

2\. Преобразуешь дорожку с вокалом к нужному тебе голосу через RVC:  
<https://2ch-ai.gitgud.site/wiki/speech/sts/rvc/rvc/>

3\. Объединяешь дорожки при помощи Audacity или любой другой тулзы для работы с аудио

Опционально: на промежуточных этапах обрабатываешь дорожку - удаляешь шумы и прочую кривоту. Кто-то сам перепевает проблемные участки.

Качество нейрокаверов определяется в первую очередь тем, насколько качественно выйдет разделить дорожку на составляющие в виде вокальной части и инструменталки. Если в треке есть хор или беквокал, то земля пухом в попытке преобразовать это.

Нейрокаверы проще всего делаются на песни с небольшим числом инструментов - песня под соло гитару или пианино почти наверняка выйдет без серьёзных артефактов.

**[B]Q: Хочу говорить в дискорде/телеге голосом определённого персонажа.[/B]**

Используй RVC (запуск через go-realtime-gui.bat) либо Voice Changer:  
<https://github.com/w-okada/voice-changer/blob/master/README_en.md>

Гайд по Voice Changer, там же рассказывается, как настроить виртуальный микрофон:  
<https://github.com/MaHivka/ultimate-voice-models-FAQ/wiki/Voice‐Changer> (часть ссылок похоже сдохла)

**[B]Q: Как обучить свою RVC-модель?[/B]**

Гайд на русском: <https://github.com/MaHivka/ultimate-voice-models-FAQ/wiki/RVC#создание-собственной-модели>  
Гайд на английском: <https://docs.aihub.wtf/guide-to-create-a-model/model-training-rvc>  
Определить переобучение через TensorBoard: <https://docs.aihub.wtf/guide-to-create-a-model/tensorboard-rvc>  
Если тыква вместо видеокарты, можно тренить в онлайне: <https://www.kaggle.com/code/varaslaw/rvc-v2-no-gradio-https-t-me-aisingers-ru/notebook?scriptVersionId=143284909> (инструкция: https://www.youtube .com/watch?v=L-emE1pGUOM )  

**[B]Q: Надо распознать текст с аудио/видео файла[/B]**

Используй Whisper от OpenAI: <https://github.com/openai/whisper>  
Быстрый скомпилированный для винды вариант: <https://github.com/Purfview/whisper-standalone-win>  
Так же есть платные решения от Сбера/Яндекса/Тинькофф.  

**[B]Коммерческие системы[/B]**

<https://elevenlabs.io> перевод видео, синтез и преобразование голоса  
<https://heygen.com> перевод видео с сохранением оригинального голоса и синхронизацией движения губ на видеопотоке. Так же доступны функции TTS и ещё что-то  
<https://app.suno.ai> генератор композиций прямо из текста. Есть отдельный тред на доске  ==>>==

Шаблон для переката: <https://2ch-ai.gitgud.site/wiki/speech/speech-shapka/>
