FROM python:3.11-slim

# Python environment settings
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# AWS environment variables
ENV AWS_REGION=us-east-2
ENV AWS_ACCOUNT_ID=390403899153
ENV ECR_REPO_NAME=notes-app

WORKDIR /app

COPY requirements.txt /app/
RUN pip install --upgrade pip && pip install -r requirements.txt

COPY . /app/
RUN python manage.py collectstatic --noinput || true

CMD ["gunicorn", "notesapi.wsgi:application", "--bind", "0.0.0.0:8000"]

# FROM python:3.11-slim

# ENV PYTHONDONTWRITEBYTECODE 1
# ENV PYTHONUNBUFFERED 1

# WORKDIR /app

# COPY requirements.txt /app/
# RUN pip install --upgrade pip && pip install -r requirements.txt

# COPY . /app/
# COPY requirements.txt /app/
# RUN python manage.py collectstatic --noinput || true

# CMD ["gunicorn", "notesapi.wsgi:application", "--bind", "0.0.0.0:8000"]



