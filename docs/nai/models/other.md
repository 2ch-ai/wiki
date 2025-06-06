Ниже предоставлен список базовых моделей, которые не получили широкой популярности.

---

[**Stable Diffusion 3.5**](https://huggingface.co/collections/stabilityai/stable-diffusion-35-671785cca799084f71fa2838) - серия базовых модеей, выпущенная Stability AI в октябре 2024 года.

Включает в себя:

- [Stable Diffusion 3.5 Medium](https://huggingface.co/stabilityai/stable-diffusion-3.5-medium)
- [Stable Diffusion 3.5 Large](https://huggingface.co/stabilityai/stable-diffusion-3.5-large)
- [Stable Diffusion 3.5 Large Turbo](https://huggingface.co/stabilityai/stable-diffusion-3.5-large-turbo)

---

[**AuraFlow**](https://huggingface.co/fal/AuraFlow) — базовая модель, выпущенная группой независимых исследователей из [fal.ai](https://fal.ai/) летом 2024 года.

---

[**Stable Diffusion 3 Medium**](https://huggingface.co/stabilityai/stable-diffusion-3-medium) - базовая модель, выпущенная Stability AI летом 2024 года. 

Отличалась высокой меметичностью в связи с тем, что борьба с NSFW в датасете дошла до такой степени, что модель не могла генерировать [девушек, лежащих на траве](https://www.fudzilla.com/news/ai/59167-stability-ai-messed-up-its-own-ai).

Веса прочих базовых моделей из семейства SD3 (такие как **Stable Diffusion 3 Large**) не были выложены в паблик - доступ к ним предоставляется только по подписочной системе.

---

[**Stable Cascade**](https://huggingface.co/stabilityai/stable-cascade) - базовая модель, выпущенная Stability AI в начале 2024 года.

Использует новую (на момент выхода) архитектуру [Würstchen](https://openreview.net/forum?id=gU58d5QeGv) и отличается более высоким уровнем "сжатия" латентного пространства по сравнению с прошлыми моделями, для примера:

- SD1 использует коэффициент сжатия 8, в результате чего изображение 1024x1024 кодируется в 128x128
- Stable Cascade достигает коэффициента сжатия 42, то есть изображение размером 1024x1024 кодируется в 24x24

---

[**Stable Diffusion 2**](https://huggingface.co/stabilityai/stable-diffusion-2) - базовая модель, выпущенная Stability AI осенью 2022 года.

По сравнению с SD1 отличается более высоким базовым разрешением (768x768, в то время как SD1 использовал 512x512). Кроме того, из датасета были отфильтрованы NSFW-изображения.

