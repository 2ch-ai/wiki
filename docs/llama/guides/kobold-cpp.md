# KoboldCpp

Гайд для ретардов для запуска LLaMA без излишней ебли под Windows. Грузит всё в процессор, поэтому ёба карта не нужна, запаситесь оперативкой и подкачкой

1. Скачиваем koboldcpp.exe <https://github.com/LostRuins/koboldcpp/releases/> последней версии.
2. Скачиваем модель в gguf формате. Например вот эту:
<https://huggingface.co/Undi95/MLewd-ReMM-L2-Chat-20B-GGUF/blob/main/MLewd-ReMM-L2-Chat-20B.q5_K_M.gguf>
Если совсем бомж и капчуешь с микроволновки, то можно взять
<https://huggingface.co/TheBloke/OpenHermes-2.5-Mistral-7B-GGUF/blob/main/openhermes-2.5-mistral-7b.Q5_K_M.gguf>
Можно просто вбить в huggingace в поиске "gguf" и скачать любую, охуеть, да? Главное, скачай файл с расширением .gguf, а не какой-нибудь .pt
3. Запускаем koboldcpp.exe и выбираем скачанную модель.
4. Заходим в браузере на <http://localhost:5001/>
5. Все, общаемся с ИИ, читаем охуительные истории или отправляемся в Adventure.

Да, просто запускаем, выбираем файл и открываем адрес в браузере, даже ваша бабка разберется!

Для удобства можно использовать интерфейс TavernAI
