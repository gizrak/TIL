## CLIP (Contrastive Language-Image Pre-Training)

> OpenAI에서 개발한 신경망 모델. 이 모델은 이미지 인코더와 텍스트 인코더를 공동으로 훈련하여 멀티모달 임베딩 공간을 학습.

### 목적

- CLIP은 주어진 이미지와 텍스트 캡션이 얼마나 잘 어울리는지 예측하는 것을 목표로 함
- CLIP은 특정 작업에 직접 최적화하지 않고도 자연어로 지시할 수 있으며, 주어진 이미지에 가장 관련 있는 텍스트 스니펫을 예측할 수 있음

### 훈련 방법

- CLIP은 다양한 (이미지, 텍스트) 쌍에서 훈련
- 훈련 중에는 올바른 이미지-캡션 벡터 쌍 간의 "코사인 유사도"를 최대화하고 모든 잘못된 쌍 간의 유사도 점수를 최소화
- 이미지와 텍스트가 의미적으로 관련된 공유 임베딩 공간을 생성하는 것이 목표

### 제로샷 기능

- GPT-2와 GPT-3의 제로샷 기능과 유사하게, CLIP은 명시적인 세부 조정 없이 보지 않은 작업에 일반화
- 원본 레이블된 예제를 사용하지 않고 이미지에 대한 관련 텍스트 스니펫을 예측

### 사용 예시

- CLIP을 사용하려면 미리 훈련된 모델 (예: ViT-B/32)을 로드하고 이미지와 텍스트를 인코딩 가능
- 의존성 설치
  ```bash
  $ pip install torch pillow
  $ pip install ftfy regex tqdm
  $ pip install git+https://github.com/openai/CLIP.git
  ```
- CLIP을 사용하는 Python 코드 예시
  ```python
  import torch
  import clip
  from PIL import Image
  
  device = "cuda" if torch.cuda.is_available() else "cpu"
  model, preprocess = clip.load("ViT-B/32", device=device)
  
  image = preprocess(Image.open("CLIP.png")).unsqueeze(0).to(device)
  text = clip.tokenize(["다이어그램", "개", "고양이"]).to(device)
  
  with torch.no_grad():
      image_features = model.encode_image(image)
      text_features = model.encode_text(text)
  
      logits_per_image, logits_per_text = model(image, text)
      probs = logits_per_image.softmax(dim=-1).cpu().numpy()
  
  print("레이블 확률:", probs)
  ```
- 이 코드 스니펫은 모델을 로드하고 이미지를 인코딩하며 텍스트를 토큰화하고 이미지와 텍스트 특성을 기반으로 레이블 확률을 계산

### API

- `clip` 모듈은 `clip.available_models()` 및 `clip.load(name, device=..., jit=False)`과 같은 메서드를 제공
- 로드한 모델은 `model.encode_image(image: Tensor)` 및 `model.encode_text(text: Tensor)`와 같은 메서드를 지원

### 참조

- [공식 CLIP GitHub 리포지토리](https://github.com/openai/CLIP)
