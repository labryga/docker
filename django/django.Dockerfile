FROM python:3.7-alpine3.9

ENV PYTHONDONTWRITEBYTECODE=1

RUN pip install django==2.2.5
