# syntax=docker/dockerfile:1.5

FROM python:3.11-slim

RUN apt-get update && \
    apt-get install -y git && \
    rm -rf /var/lib/apt/lists/*

WORKDIR /code

# Copy only requirements first (for cache)
COPY requirements.txt .

# Install deps with cache + retry + timeout
RUN --mount=type=cache,target=/root/.cache/pip \
    pip install --upgrade pip && \
    pip install --timeout=100 --retries=5 -r requirements.txt

# Copy app later
COPY . /code/app

ENV PYTHONPATH=/code/app

EXPOSE 8000

CMD ["fastapi", "dev", "/code/app/main.py", "--host", "0.0.0.0", "--port", "8000"]
