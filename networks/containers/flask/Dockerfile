FROM python:3

RUN apt-get update -y
RUN apt-get install -y python3-pip python3-dev

WORKDIR /app

RUN pip install Flask requests flask_mysqldb flask_mysql

COPY . .

EXPOSE 5002

CMD ["python","./app.py"]