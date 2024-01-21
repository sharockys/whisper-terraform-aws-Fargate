
# Description 
This project is a collection of scripts and configuration files to deploy the Whisper ML application on aws using FastAPI and Docker. 

## Overview
There are only on script in this app. This Python project is managed by Poetry. 
A dockerfile is provided to build the docker image.
A docker-compose file is provided to run the docker image for development purposes. 
In the docker-compose file, we have limited the resources to allow estimate the cost of running the app on aws. 
The docker-compose file is not used in production. 
A Makefile is provided to simplify the development and deployment process. 

an audio file is provided for testing purpose but not push to git repo. 

## Pre-requisites
- Docker
- Docker-compose
- Python ^3.10 
- Poetry

## Installation
- Clone the repo

```bash
poetry install
```

## Development and usage
with Makefile, you can run the following commands:
```bash
make run # run the app in development mode
make test # run the test with curl 
make format # format the code and check for linting errors
make build # build the docker image
``` 
With docker-compose, you can run the following commands:
```bash
docker-compose up --build # build and run the app 
``` 
Use Curl to test the app
```bash
curl -X POST -H "Content-Type: multipart/form-data" -F "audio_file=@audio.mp3" http://localhost:8000/transcribe
```
Health check
```bash
curl -f http://localhost:8000/healthz
```

## Docs 
The docs are generated using FastAPI. 
To view the docs, run the app and go to http://localhost:8000/docs 
