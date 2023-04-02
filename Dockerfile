FROM python:3.8.12
RUN pip install apache-airflow==2.4.3
RUN pip install 'pymongo[srv]'
COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt
ARG GOOGLE_CLOUD_PROJECT
ENV GOOGLE_CLOUD_PROJECT=${GOOGLE_CLOUD_PROJECT}