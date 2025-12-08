#<-----------------------STAGE1------------>
# ------------------ STAGE 1 ------------------
FROM python:3 AS builder

WORKDIR /app

# install dependencies
COPY requirements.txt .
RUN pip install --prefix=/install -r requirements.txt


# ------------------ STAGE 2 ------------------
FROM python:3.10-slim

WORKDIR /app
ENV PYTHONUNBUFFERED=1

# ------------------ STAGE 1 ------------------
FROM python:3 AS builder

WORKDIR /app

# install dependencies
COPY requirements.txt .
RUN pip install --prefix=/install -r requirements.txt


# ------------------ STAGE 2 ------------------
FROM python:3.10-slim

WORKDIR /app
ENV PYTHONUNBUFFERED=1

# ------------------ STAGE 1 ------------------
FROM python:3 AS builder

WORKDIR /app

# install dependencies
COPY requirements.txt .
RUN pip install --prefix=/install -r requirements.txt


# ------------------ STAGE 2 ------------------
FROM python:3.10-slim

WORKDIR /app
ENV PYTHONUNBUFFERED=1

# copy installed dependencies
COPY --from=builder /install /usr/local

# copy project files
COPY . .

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
