FROM python:3.11.9-alpine3.20
WORKDIR /app/cron/
COPY requirements.txt .
RUN pip3 install -r requirements.txt
COPY .env .env
COPY transformer.py transformer.py