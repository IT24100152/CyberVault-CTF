FROM python:3.12-slim

WORKDIR /app

COPY requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt \
    && useradd --create-home --uid 10001 challenge

COPY app.py users.db ./

RUN chown -R challenge:challenge /app

USER challenge

EXPOSE 5000

CMD ["python", "app.py"]