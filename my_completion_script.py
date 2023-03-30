import sys
import openai
import config

openai.api_key = config.openai_api_key 

response = openai.ChatCompletion.create(
    model="gpt-3.5-turbo",
    messages=[
        {"role": "system", "content": "You are a helpful coding assistant."},
        {"role": "user", "content": f"Complete the following Python code: {sys.argv[1]}"},
    ],
    max_tokens=50,
    n=1,
    stop=None,
    temperature=0.8,
)

print(response.choices[0].message['content'].strip(), end="")

