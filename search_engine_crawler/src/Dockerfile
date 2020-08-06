FROM python:3.6.0-alpine

WORKDIR /app
ADD ../.. /app

RUN apk --no-cache --update add build-base && \
    pip install -r /app/requirements.txt && \
    apk del build-base

CMD python -u crawler/crawler.py $URL