#Stage 1: for build
FROM python:3.13-alpine AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install --user --no-cache-dir -r requirements.txt

#Stage 2: for runtime
FROM python:3.13-alpine
WORKDIR /app

RUN adduser -D user-david

COPY --from=builder /root/.local /home/user-david/.local
COPY backend.py .

RUN chown -R user-david:user-david /home/user-david/.local /app

USER user-david
ENV PATH=/home/user-david/.local/bin:$PATH

EXPOSE 5001
CMD ["python", "backend.py"]