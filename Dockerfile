FROM python:3.11-slim

WORKDIR /app

# Tizim paketlari
RUN apt-get update && apt-get install -y --no-install-recommends \
    gcc \
    && rm -rf /var/lib/apt/lists/*

# Python kutubxonalar
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Bot kodi
COPY bot.py .

# Bot tokenini environment variable sifatida o'qish
ENV PYTHONUNBUFFERED=1

# Botni ishga tushirish
CMD ["python", "bot.py"]
