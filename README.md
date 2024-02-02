# Whisper ML Deployment Project 

This project is a collection of scripts and configuration files to deploy the Whisper ML application on aws. 

## Overview
There are two main components to the Whisper ML deployment project:
1. Whisper APP - The Whisper APP is a FastAPI application that exposes APIs for users to interact with the Whisper ML model. 
2. Terraform - Terraform is used to provision the infrastructure required to run the Whisper APP.

## Project Structure

### PyProject
```
├── Dockerfile
├── Makefile
├── README.md
├── app.py
├── audio.mp3
├── docker-compose.yml
├── poetry.lock
└── pyproject.toml
```

### Terraform
```
├── README.md  
├── boostrap
│   ├── main.tf
│   ├── modules
│   │   ├── code_build
│   │   │   ├── buildspec.yml.tpl
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   └── variables.tf
│   │   ├── code_commit
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   └── variables.tf
│   │   ├── ecr
│   │   │   ├── main.tf
│   │   │   ├── outputs.tf
│   │   │   └── variables.tf
│   │   └── iam
│   │       ├── main.tf
│   │       ├── outputs.tf
│   │       └── variables.tf
│   ├── outputs.tf
│   └── variables.tf
└── deployment
    ├── main.tf
    ├── modules
    │   └── ecs
    │       ├── alb.tf
    │       ├── ecs_iam.tf
    │       ├── efs.tf
    │       ├── main.tf
    │       ├── outputs.tf
    │       ├── variables.tf
    │       └── vpc.tf
    ├── outputs.tf
    └── variables.tf
```
## More documentation 
https://wanghaoxian.notion.site/Whisper-MVP-by-Haoxian-WANG-bc2e41735bd641249c69dbfd3957616e 

