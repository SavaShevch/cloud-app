# Базовый образ с Python
FROM python:3.12-slim

WORKDIR /app

# Сначала зависимости
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Затем код приложения
COPY . .

EXPOSE 5000

# Запуск Flask через Gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "--workers", "2", "app:app"]
