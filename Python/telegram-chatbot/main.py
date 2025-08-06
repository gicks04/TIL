# main. py
'''
pip install fastapi 로 라이브러리 설치 후 진행
pip install uvicorn[standard]
로 라이브러리 설치 후 진행
uvicorn main:app --reload
로 서버 구동
'''

from fastapi import FastAPI, Request
import random
import requests

from dotenv import load_dotenv
import os

from openai import OpenAI

# .env파일에 내용들을 불러옴
load_dotenv()

app = FastAPI()

def send_message(chat_id, message):
    # bot에게 답장을 해보자!
    # .env에서 토큰을 가져옴
    bot_token = os.getenv('telegram_bot_token')
    url = f'https://api.telegram.org/bot{bot_token}'

    body = {
        # 사용자 chat_id는 어디서 가져옴..?
        'chat_id': chat_id,
        'text': message
    }
    requests.get(url + f'/sendMessage', body)


# /docs - > 라우팅 목록 페이지로 이동 가능

# http://127.0.0.1:8000/
# http://localhost:8000

@app.get('/')
def home():
    return {'home': 'sweet home'}

# https://api.telegram.org/bot8379765061:AAFUW5XfjIood5jnoTzYwsguwyj-PzKD-v0/setWebhook

# /telegram 라우팅으로 텔레그램 서버가 bot에 업데이트가 있을 경우, 우리에게 알려줌
@app.post('/telegram')
async def telegram(request: Request):
    print('텔레그램에서 요청이 들어왔다!!!')

    data = await request.json()
    print(data)
    sender_id = data['message']['chat']['id']
    input_msg = data['message']['text']

    client = OpenAI(api_key=os.getenv('open_API_key'))
    res = client.responses.create(
            model='gpt-4.1-mini',
            input=input_msg,
    )

    send_message(sender_id, res.output_text)
    return {'status':'ok'}
