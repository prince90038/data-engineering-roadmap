Docker basics reminders

Example Dockerfile snippet:

```
FROM python:3.11-slim
WORKDIR /app
COPY requirements.txt ./
RUN pip install -r requirements.txt
COPY . .
CMD ["python", "app.py"]
```

Use `docker build -t myapp .` and `docker run --rm myapp` to test.
