FROM python:3.11-slim

ENV PIP_NO_CACHE_DIR=true
ENV HNSWLIB_NO_NATIVE=1
RUN apt-get update && apt-get install build-essential -y

WORKDIR /tmp
COPY requirements.txt /tmp/requirements.txt
RUN pip install -r requirements.txt

WORKDIR /app
COPY . /app
ENTRYPOINT ["./babyagi.py"]
