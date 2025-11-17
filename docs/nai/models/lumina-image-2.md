---
title: Lumina Image 2.0
---

# Lumina Image 2.0

**Lumina Image 2.0** — модель для генерации изображений из текстового описания, разработанная командой Alpha-VLLM из Shanghai AI Laboratory и выпущенная в январе 2025 года.

Модель представляет собой 2-миллиардный Flow-based Diffusion Transformer и отличается хорошим пониманием промптов на естественном языке.

## Ссылки
- [Офф. репозиторий на Huggingface](https://huggingface.co/Alpha-VLLM/Lumina-Image-2.0)
- [Офф. репозиторий на GitHub](https://github.com/Alpha-VLLM/Lumina-Image-2.0)
- [Установка в ComfyUI](https://comfyanonymous.github.io/ComfyUI_examples/lumina2/)
- [GGUF-кванты](https://huggingface.co/calcuis/lumina-gguf)
- [Lumina-Accessory](https://github.com/Alpha-VLLM/Lumina-Accessory) - фреймворк для fine-tuning Lumina-Image-2.0, который позволяет обучить модель выполнять одну или сразу несколько задач: inpaint, изменение освещения, редактирование по текстовым инструкциям и генерацию с учётом пространственных условий (ControlNet)

## Системные требования

Для работы с оригинальной версией модели требуется видеокарта с 8+ GB VRAM. Для карт с меньшим числом VRAM можете использовать GGUF-кванты.

Данная модель и её производные могут быть запущены на интерфейсах [ComfyUI](https://github.com/comfyanonymous/ComfyUI) и [Forge Classic Neo](https://github.com/Haoming02/sd-webui-forge-classic/tree/neo).

## Технические характеристики

* **Архитектура**: Flow-based Diffusion Transformer с 2 миллиардами параметров  
* **Текстовый энкодер**: [Gemma-2-2B](https://huggingface.co/google/gemma-2-2b)  
* **VAE**: 16-канальный, взят готовый из [FLUX](./flux.md)  

## Neta-Lumina

[Neta-Lumina](https://huggingface.co/neta-art/Neta-Lumina) - файнтьюн Lumina-Image-2.0 для генерации аниме-изображений, разработанный командой **Neta.art Lab** и выпущенная в июле 2025 года.

Neta-Lumina обучена на датасете из более чем 13 миллионов изображений в аниме-стиле с мультиязычными промптами (в основном английский, китайский и японский). Для обучения данной модели было затрачено более чем 46,000 GPU-часов на A100.

Модель понимает естественный язык и следует сложным промптам. При этом модель так же поддерживает booru-теги и умеет работать с комбинациями booru-теги + натуртекст.

??? info "Инструкция к LLM для генерации промптов для Neta-Lumina"
    === "Универсальный промпт (рекомендуется для Gemini 2.5 Pro, GPT‑o3, Claude 4)"
        ```
        You are a professional AI drawing prompt expert, specializing in creating high-quality prompts for Neta Lumina drawing models. Please strictly follow the following specifications to help me generate prompts:
        ## Neta Lumina prompt structure specification
        ### Required system prefix (must be included in each prompt):
        You are an assistant designed to generate anime images based on textual prompts. <Prompt Start> 
        ### Standard sequence of parts (9 parts):
        1. Character trigger words (e.g., 1girl, 1boy, 2girls, character name, etc.)
        2. Picture style prompt words (such as: @wlop, @nixeu, @quasarcake and other artist tags)
        3. Character prompt words (appearance) (hair color, eye color, basic features)
        4. Character costume prompt (specific costume description)
        5. Character expression and action prompts (expression, posture, action)
        6. Picture perspective prompt words (angle, range such as upper body, close-up, etc.)
        7. Special effects prompts (lighting, special effects)
        8. Scene atmosphere prompt (environment, atmosphere)
        9. Quality tips (best quality)

        ### Natural language part standard order (5 parts):
        1. ** Composition aspect **: picture layout, visual balance, composition principles (such as golden section, symmetrical composition, etc.)
        2. **Light and shadow processing**: light source properties, lighting effect, color temperature characteristics, shadow processing
        3. **Characteristics and Clothing**: Detailed description of appearance, material and texture of clothing
        4. **Scene details**: environmental elements, background objects, spatial atmosphere, narrative function
        5. **Artistic style**: Painting techniques, artistic schools, overall style definition
        ## Important format requirements
        ### Neta Lumina special grammar:
        -Underline to space: school_uniform → school uniform
        -Weight bracket expansion: (klee_(genshin_impact): 1.2), → (klee \(genshin impact\): 1.2),
        -The artist tag is reinforced with the @ symbol: @wlop, @nixeu
        -Negative prompt words also need the same system prefix
        ### Quality standards:
        -The Tag part should be concise and accurate to avoid redundancy
        -Natural language should be vivid and concrete, with a sense of picture
        -The overall description should be logical and clear
        -Ensure that Tags complement and do not duplicate natural language
        ## Creative tasks
        [My creative idea]: {type in your creative idea here}
        [Specific requirements]: {Enter special requirements here, such as style preference, emotional tone, technical requirements, etc.}
        ## Please help me complete the following tasks:
        1. ** Analyze the idea **: Understand my creative intention and core elements
        2. **Structural planning**: Organize Tag and natural language content in the standard order
        3. **Generate prompt words**: Create complete Neta Lumina format prompt words
        4. **Provide variants**: If necessary, provide 2-3 versions from different angles
        5. **Optimization Suggestions**: Give specific suggestions for further improvement
        ## Output format example
        **Full prompt:**
        You are an assistant designed to generate anime images based on text prompts. <Prompt Start> [complete Tag section, strictly in the order of 9 paragraphs], [complete natural language section, strictly in the order of 5 paragraphs]
        Example: You are an assistant designed to generate anime images based on text prompts. <Prompt Start>
        1girl, lineart, greyscale, yoneyama mai, solo, long red hair, green eyes, business casual, blazer, blouse, contemplative expression, leaning on railing, wind blown hair, back view, dramatic sunset, golden hour lighting, lens flare, urban rooftop, city panorama, best quality, The composition utilizes the golden ratio to position the figure against the vast urban sunset, creating a powerful silhouette that speaks to ambition and reflection. Dramatic golden-hour lighting backlights her flowing auburn hair while casting long shadows across the rooftop, with lens flares adding cinematic drama to the sky. Her professional attire - a tailored charcoal blazer over a silk blouse - moves naturally in the evening breeze, the fabrics rendered with attention to how wind affects different materials. The cityscape extends to the horizon, featuring architectural details of glass towers, traditional buildings, and infrastructure that tells the story of urban development. The artistic approach combines architectural photography principles with character-focused narrative illustration.
        **Structure analysis:**
        -Tag part parsing: [Briefly explain the function of each part]
        -Natural language parsing: [explain the focus of each section]
        -Style features: [highlight the uniqueness of this prompt]
        Please start helping me create prompts now.
        ```
    === "Промпт для GPT-4o"
        ```
        Now I need a prompt assistant to help me write the prompt:
        You are an artist who excels at creating AI paintings using the Lumina model and can craft high-quality Lumina prompts. I want to use AI for my creative process. I will provide you with some elements, and you need to help me refine these prompts by writing them as detailed as possible.
        You should follow the following thought process, quality reference tips, and I will tell you what needs to be sent back to me.
        process of thinking ：
        1. I will give you the elements I need, such as expression, movement, clothing, body, and even hair color in detail, and then you help me put them together into a complete prompt in a certain format.
        Your prompt should include the following details: whether the shot is a close-up, medium shot, or long shot; whether the subject is fully or partially shown; the subject's gender (male or female); their age (child or young adult); and detailed descriptions of their clothing. Specific details about the color of their hair, eyes, and clothing are required, such as whether they are dark blue or light blue, whether the subject is facing left or right, the angle of the shot, and any notable features or actions.
        2. The elements I give you may only contain part of the prompt above, and you have to fill in the rest.
        3. Allow you to have imagination and freedom of play space, optimize the characters, objects and scenes that can be associated with, so that the details of the picture are very rich and full of high beauty, the more detailed the better.
        4. Try to think of ways to make the AI better at drawing and understanding.
        Quality reference tips:
        Let me give you a few more complete and high-quality tips I'm looking forward to as a reference.
        I want a man with green eyes to be illuminated in the dark by a kerosene lamp.
        Your expanded full prompt:
        "Atmospheric anime illustration of a young person with light blonde/silver hair and striking green eyes illuminated by a vintage oil lantern in darkness. Close-up composition showing character's face partially lit by warm yellow lantern light against deep black/green background. Subject has disheveled hair and melancholic or curious expression, reaching toward or adjusting the antique lantern with delicate hands. Scene suggests nighttime setting in dark room or cave with wooden surface visible under lantern. Dramatic chiaroscuro lighting creates strong contrast between illuminated features and surrounding darkness. Soft painterly digital art style with visible brushstrokes and glowing light effects. Color palette consists primarily of warm yellows and oranges from lamp contrasting with cool dark greens and blacks of shadows. Moody, contemplative atmosphere with fantasy or historical undertones. Fine details in the metal lantern structure with realistic flame effects inside glass. Professional anime illustration with cinematic lighting techniques creating mysterious, introspective mood."
        short tag：
        1boy, solo, silver hair, blonde hair, green eyes, oil lamp, lantern, dark background, chiaroscuro, night, disheveled hair, melancholic expression, curious expression, reaching out, delicate hands, dramatic lighting, contrast, painterly, glowing light, warm lighting, fantasy, close-up, face focus
        Chinese translation:
        "氛围感动漫插画，描绘一位浅金色/银色头发和引人注目的绿色眼睛的年轻人，在黑暗中被一盏复古油灯照亮。特写构图展示角色的脸被温暖的黄色灯光部分照亮，背景是深黑色/绿色。主体头发凌乱，表情忧郁或好奇，用纤细的手伸向或调整古董灯。场景暗示夜间设置在黑暗的房间或洞穴中，灯下可见木质表面。戏剧性明暗对比照明在被照亮的特征和周围黑暗之间创造强烈对比。柔和的绘画风格数字艺术，可见笔触和发光效果。色彩搭配主要由灯的温暖黄色和橙色与阴影的冷调深绿色和黑色形成对比。忧郁、沉思的氛围，带有奇幻或历史色彩。金属灯结构中的精细细节，玻璃内部有逼真的火焰效果。专业动漫插画，电影感照明技术创造神秘、内省的情绪。"
        remarks ：
        The key features of this image are:
        Composition: close-up composition, highlighting the face and hands of the person illuminated by the oil lamp
        Lighting: The strong contrast between light and dark, the warm yellow light of the oil lamp contrasts sharply with the surrounding darkness
        Characteristics: Light blond/silver hair, green eyes, melancholy or curious expression
        Scene details: the fine depiction of an antique oil lamp/lantern, wooden surface, dark environment
        Art style: Anime illustrations with painting style, emphasizing light and shadow effects and atmosphere, creating a mysterious and contemplative mood
        We type in: Man on bus.
        "Atmospheric anime illustration of a handsome young man with black hair and blue eyes riding on a public bus or train. Character wears a stylish modern outfit consisting of light blue/white shirt with black jacket featuring orange trim details and shoulder backpack. Subject is shown in profile view holding onto overhead handrail while listening to music with black earbuds. Scene depicts crowded public transportation with other commuters visible but slightly blurred in background. Cool blue color palette creates calm urban atmosphere with soft natural lighting streaming through windows. Character has distinctive anime styling with sharp features and detailed clothing design. Environment shows realistic public transit interior with destination signs visible in Chinese/Japanese characters. Painterly digital art style with soft light effects and subtle depth of field. Clean, contemporary anime aesthetic with slice-of-life urban setting. Professional digital illustration capturing everyday city life moment with cinematic framing."
        short tag：
        1boy, solo, male, black hair, blue eyes, stylish outfit, light blue shirt, white shirt, black jacket, orange trim, shoulder backpack, profile, handrail, earbuds, listening to music, train interior, bus interior, public transportation, commuters, blurry background, blue color palette, urban, soft lighting, window, sharp features, detailed clothing, japanese text, chinese text, depth of field, slice of life
        Chinese translation:
        "氛围感动漫插画，描绘一位黑发蓝眼英俊年轻男子乘坐公共汽车或火车。角色穿着时尚现代装束，包括浅蓝色/白色衬衫，配有橙色镶边细节的黑色夹克和肩背包。主体以侧面视角展示，手握头顶扶手，同时戴着黑色耳塞听音乐。场景描绘了拥挤的公共交通工具，背景中其他通勤者可见但略微模糊。冷蓝色调色板创造出平静的城市氛围，柔和的自然光线透过窗户照射进来。角色具有独特的动漫风格，轮廓分明的五官和详细的服装设计。环境展示了真实的公共交通内部，可见带有中文/日文字符的目的地标志。绘画风格的数字艺术，带有柔和的光效和微妙的景深。干净、现代的动漫美学，带有生活片段(slice-of-life)城市背景。专业数字插画，以电影般的构图捕捉日常城市生活瞬间。"
        remarks ：
        The key features of this image are:
        Composition: The portrait is composed from the side, highlighting the image of a young man on a bus/train
        Lighting: Soft natural light streaming through the Windows creates a calming blue tone
        Characteristics: young male with black hair and blue eyes, wearing a blue and white shirt and a black jacket, wearing headphones and holding the armrest
        Scene details: inside the public transport, other passengers are blurred, Chinese/Japanese destination signs
        Art style: modern animation style, the color tone is mainly blue, creating a quiet moment in daily life
        You need to reply to my message:
        1. Complete English Caption prompt words.
        2. Short tags generated from prompts.
        3. The corresponding Chinese translation.
        4. Chinese notes, briefly summarize the key features of this picture, including the following aspects: composition, light processing, character features, scene details, artistic style.
        5. Your extended results can be more complete and detailed than the examples above.
        ```
### Ссылки

- [Офф. репозиторий на Huggingface](https://huggingface.co/neta-art/Neta-Lumina)
- [Офф. гайд по промптам](https://nieta-art.feishu.cn/wiki/RY3GwpT59icIQlkWXEfcCqIMnQd)
- [Анонс Neta-Lumina](https://www.neta.art/blog/neta_lumina/)
- [Таблица со стилями](https://neta-lumina-style.tz03.xyz/)
- [GGUF-кванты](https://huggingface.co/neta-art/neta-lumina-gguf)

## NetaYume Lumina

[NetaYume Lumina](https://civitai.com/models/1790792/netayume-lumina-neta-luminalumina-image-20) - самый популярный чекпоинт на основе Neta-Lumina на момент ноября 2025.

Заявляется как файнтюн различных версий Neta-Lumina, обученный на датасете из 10 миллионов изображений, на что было затрачено более чем 4000 GPU-часов на B200.

По альтернативному мнению является мерджем эстетик лор под видом крупнобюджетного файнтюна.

Автор имеет спорную репутацию будучи неоднократно пойманым на лжи и махинациях. В описании много путаницы и противоречий вместе с признаниями о неработоспособности новых персонажей, отличия от базовой модели и между версиями зачастую минимальны и все проблемы на месте.

### Ссылки

- [NetaYume Lumina на CivitAI](https://civitai.com/models/1790792/netayume-lumina-neta-luminalumina-image-20)
- [Таблица со стилями](https://gumgum10.github.io/gumgum.github.io/) - работает и для Neta-Lumina
- [GGUF-кванты](https://huggingface.co/Immac/NetaYume-Lumina-Image-2.0-GGUF)