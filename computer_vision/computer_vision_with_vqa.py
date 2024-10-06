!pip install transformers torch
!pip install requests

import json
from transformers import ViltProcessor, ViltForQuestionAnswering
from PIL import Image
import torch

# Hugging Face'den VQA modeli ve processor'ı yükleyelim
model = ViltForQuestionAnswering.from_pretrained("dandelin/vilt-b32-finetuned-vqa")
processor = ViltProcessor.from_pretrained("dandelin/vilt-b32-finetuned-vqa")

# Görüntüyü dosya yolundan yükleme fonksiyonu
def load_image(image_path):
    image = Image.open(image_path)
    return image.convert("RGB")  # ViltProcessor RGB formatında çalıştığı için, görüntüyü RGB formatına dönüştürüyoruz.

# Soru ve görüntüyü işleme ve cevap alma fonksiyonu
def get_answer_for_image_and_question(image_path, question):
    # Görüntüyü yükleyelim
    image = load_image(image_path)

    # Görüntü ve soruyu işleyelim
    inputs = processor(images=[image], text=question, return_tensors="pt")

    # Modelden cevabı alalım
    with torch.no_grad():
        outputs = model(**inputs)
        logits = outputs.logits
        predicted_class = logits.argmax(-1).item()

    # Cevabı dönelim
    if predicted_class == 0:
        return "Yes"
    elif predicted_class == 1:
        return "No"
    else:
        return "Unknown"

# JSON dosyasını okuma fonksiyonu
def load_questions_from_json(json_path):
    with open(json_path, "r") as f:
        data = json.load(f)
    return data['questions']

# Ana fonksiyon
if __name__ == "__main__":
    # Soruların bulunduğu JSON dosyasını yükleyelim
    questions_file = "computer_vision/vqa_questions.json"  # Soruların bulunduğu JSON dosyasının adı 

    # JSON dosyasından soruları ve görüntüleri okuyalım
    questions = load_questions_from_json(questions_file)

    # Her kategorideki soruları görüntü ile eşleştirip cevap alalım
    for category in questions:
        for item in category["questions"]:  # Kategorilerdeki sorular listesine erişiyoruz
            image_path = 'computer_vision/grasshopper.PNG'  # Tek bir resim dosyası kullanıyorsanız sabit atama yapılabilir
            question = item["question"]

            # Sonucu alalım
            answer = get_answer_for_image_and_question(image_path, question)

            # Sonucu yazdır
            print(f"Category: {category['category']}")
            print(f"Question: {question}")
            print(f"Answer: {answer}")
            print("-" * 30)
