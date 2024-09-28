# Pony Diffusion V6 XL

[[Скачать на CivitAI]](https://civitai.com/models/257749/pony-diffusion-v6-xl)

**Pony Diffusion V6 XL** (так же известный как Pony Diffusion или PonyXL) является самым популярным файнтьюном [Stable Diffusion XL](./stable-diffusion-xl.md).

Несмотря на название, эта модель умеет генерировать не только поней, но и аниме. Данная модель получила большую популярность в связи с тем, что умеет генерировать сложные позы и NSFW концепты с малым числом проблем в анатомии (в сравнении с другими чекпоинтами).

Данная модель была обучена энтузиастом с никнеймом **Astralite**, известным своей любовью к франшизе My Little Pony.

## Основанные на Pony Diffusion модели
Большую часть мёрджей/тьюнов поней можно [найти на цивите](https://civitai.com/search/models?baseModel=Pony&modelType=Checkpoint&sortBy=models_v9) - доступных моделей на основе поней настолько много, что на цивите под них выделили отдельную категорию.

Как правило, лоры и контролнеты от поней совместимы со всеми производными чекпоинтами.

### AutismMix
!!! tip "Выбор ньюфага"
    Рекомендуется начать с этого чекпоинта, как наиболее беспроблемного.

Наиболее популярным производным чекпоинтом от поней является [AutismMix](https://civitai.com/models/288584/autismmix-sdxl), который представляет собой мёрдж поней с несколькими лорами.

Данный чекпоинт улучшает базовый стиль и анатомию, но ценой является снижение вариативности генераций.

## Где взять лоры
- [Лоры на civitai](https://civitai.com/search/models?baseModel=Pony&modelType=LORA&sortBy=models_v9)
- [Лоры и дополнительная информация с форча](https://rentry.org/ponyxl_loras_n_stuff)

## ControlNet-модели
- [Anytest v1](https://huggingface.co/2vXpSwA7/iroiro-lora/tree/main/test_controlnet)
- [Anytest v2](https://huggingface.co/2vXpSwA7/iroiro-lora/tree/main/test_controlnet2)
- [Union SDXL 1.0](https://huggingface.co/xinsir/controlnet-union-sdxl-1.0)

В случае Anytest, нужно качать модели, отмеченные символами `p` (cnlllite-anytest_**P**...) и `pn` (CN-anytest_v3-..._**pn**_...).

## Особенности написания промптов
### Теги качества
В **positive prompt** нужно добавлять:
```
score_9, score_8_up, score_7_up, score_6_up, score_5_up, score_4_up, source_anime
```

В **negative prompt** стоит добавлять:
```
source_pony, source_furry, source_cartoon
```

??? abstract "Объяснение score_9 и прочего"

    Наиболее подробное описание принципа работы скоров дал сам автор поней в [своей статье на цивите](https://civitai.com/articles/4248).

    Если вкратце, то, перед обучением PonyXL, сперва был обучен aesthetic-классификатор, задачей которого было определить "качество" изображения в формате плавающей цифры от нуля до единицы.

    Говоря проще, данный классификатор являлся инструментом, который помогал отделять низкосортные любительские картинки от шедевров.

    Данный классификатор использовался для оценки каждого изображения в датасете Pony Diffusion. В зависимости от оценки классификатора, для каждого изображений, в добавок к основному запросу, была добавлена строка с описанием тегов качества в следующем формате:  
    - **Качество 90%-100%**: score_9, score_8_up, score_7_up, score_6_up, score_5_up, score_4_up  
    - **Качество 80%-90%**: score_8, score_7_up, score_6_up, score_5_up, score_4_up  
    - **Качество 70%-80%**: score_7, score_6_up, score_5_up, score_4_up  
      
    И так далее.  
      
    Теоретическая задумка была в том, чтобы, указывая тег score_9, мы бы "просили" модель ориентироваться, в первую очередь, на картинки, которые получили aestetic-оценку 90% и выше, что должно было снижать вариативность, но улучшать качество изображений.
      
    Однако, сам автор поней считает, что он облажался, и, по факту, модель выучила, что вся строка целиком описывает хорошее качество, а не её отдельные части:  

    > In reality I exposed myself to a variation of The Clever Hans effect where the model learned that the whole long string correlates to the "good looking" images, instead of separate parts of it. I will fix this in V7.  
      
    Как итог - общей рекомендацией по промптам для чекпоинтов на основе Pony Diffusion является использование подробной строки, описывающей максимальное качество, а именно:

    ```
    score_9, score_8_up, score_7_up, score_6_up, score_5_up, score_4_up
    ```

### Прочие теги
Кроме тегов качества, в датасете поней было использовано несколько вспомогательных тегов, которые вы также можете использовать в своих промптах.

#### Источник
- source_anime  
- source_pony  
- source_furry  
- source_cartoon  

#### Возрастной рейтинг
- rating_safe  
- rating_questionable  
- rating_explicit  
