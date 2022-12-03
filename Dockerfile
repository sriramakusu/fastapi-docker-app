# pull official base image
FROM python:3.10.8-slim-buster

# set working directory
WORKDIR /usr/src/app

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Install system dependencies
RUN apt-get update \
    && apt-get -y install netcat gcc \
    && apt-get clean

# install python dependencies
RUN pip install --upgrade pip
COPY ./requirements.txt .
RUN pip install -r requirements.txt

# add app from current dir of the machine to workdir of container
COPY . .

# add entrypoint.sh and provide persmissions
# chmod +x on a file means, you'll make it executable. 
COPY ./entrypoint.sh .
RUN chmod +x /usr/src/app/entrypoint.sh

# run entrypoint.sh (ENTRYPOINT["executable", "param1", "param2"])
ENTRYPOINT ["/usr/src/app/entrypoint.sh"]


