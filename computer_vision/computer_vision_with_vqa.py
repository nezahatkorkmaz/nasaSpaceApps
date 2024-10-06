!pip install transformers torch
!pip install requests

from transformers import ViltProcessor, ViltForQuestionAnswering
from PIL import Image
import torch
import json

# Load the VQA model and processor from Hugging Face
model = ViltForQuestionAnswering.from_pretrained("dandelin/vilt-b32-finetuned-vqa")
processor = ViltProcessor.from_pretrained("dandelin/vilt-b32-finetuned-vqa")

# Function to load an image from the file path
def load_image(image_path):
    try:
        image = Image.open(image_path)
        return image.convert("RGB")  # Convert the image to RGB since ViltProcessor works with RGB format.
    except Exception as e:
        print(f"Error loading image: {e}")
        return None

# Function to process the question and image, and return an answer
def get_answer_for_image_and_question(image_path, question):
    image = load_image(image_path)

    if image is None:
        return "Image not found or cannot be loaded."

    # Process the image and question
    inputs = processor(images=[image], text=question, return_tensors="pt")

    # Get the answer from the model
    with torch.no_grad():
        outputs = model(**inputs)
        logits = outputs.logits
        predicted_class = logits.argmax(-1).item()

    # Return the answer
    if predicted_class == 3:
        return "Yes"
    elif predicted_class == 9:
        return "No"
    else:
        return "Unknown"

# Function to read the questions from a JSON file
def load_questions_from_json(json_path):
    try:
        with open(json_path, "r") as f:
            data = json.load(f)
        return data['questions']
    except Exception as e:
        print(f"Error loading JSON file: {e}")
        return None

# Main function
if __name__ == "__main__":
    # Load the JSON file containing the questions
    questions_file = "/kaggle/input/adsfghj/vqa_questions.json"  # Path to the JSON file containing questions
    questions = load_questions_from_json(questions_file)

    if questions is None:
        print("Failed to load questions.")
    else:
        # Loop through each category and question, then pair it with an image to get the answer
        for category in questions:
            for item in category["questions"]:  # Access the list of questions in each category
                image_path = '/kaggle/input/adsfghj/grasshopper.PNG'  # Use a fixed image path if only one image is used
                question = item["question"]

                # Get the result
                answer = get_answer_for_image_and_question(image_path, question)

                # Print the result
                print(f"Category: {category['category']}")
                print(f"Question: {question}")
                print(f"Answer: {answer}")
                print("-" * 30)
