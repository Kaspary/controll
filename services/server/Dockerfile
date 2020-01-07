FROM python:3.7.5-slim

# set working directory
WORKDIR /usr/src/app

#add and install requirements
COPY ./requirements.txt /usr/src/app/requirements.txt

# install dependencies
#RUN apt-get update -y && \
#    apt-get install  gcc g++ musl-dev libpq-dev -y && \
#    python3 -m pip install --upgrade pip && \
#    python3 -m pip install -r requirements.txt --no-cache-dir


RUN python --version

RUN apt update -y && \
	apt install python3-pip -y && \
	pip3 install -r requirements.txt --no-cache-dir


# add app
COPY . /usr/src/app

# migrate database
RUN python3 manage.py makemigrations && \
   python3 manage.py migrate

# run server
# CMD
