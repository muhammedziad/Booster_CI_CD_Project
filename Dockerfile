FROM ubuntu:18.04

RUN apt-get update && \
    apt-get install python3 python3-pip -y

RUN python3.6 -m pip install pip --upgrade && \
    python3.6 -m pip install wheel

COPY . /booster_project
WORKDIR /booster_project

EXPOSE 8000

RUN pip3 install -r requirements.txt

RUN python3.6 manage.py makemigrations
RUN python3.6 manage.py migrate

CMD ["python3.6", "manage.py", "runserver", "0.0.0.0:8000"]

