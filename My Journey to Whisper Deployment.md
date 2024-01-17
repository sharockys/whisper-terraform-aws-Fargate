# My journey to Whisper Deployment 

## Objective
What: Speech to text application for transcribe telephone calls 
Who: the sales staff - Internal usage 
Why: to improve sales staff analytics and productivity 

## Requirements
Platform: AWS
IaC: Terraform


## Main idea
- A simple REST API 
    - accepts an audio file
    - returns a transcription of the audio.
- Containerized using Docker
- Deployed to AWS using Terraform


## Possible Architecture

### Storage 
#### S3

#### EFS 


### Computing Platform
#### Lambda 

#### Fargate 

#### ECS Task set w/o GPU

#### EKS (AWS managed Kubernetes)

#### EC2 VM w/o GPU (traditional way)




## Model Selection and Optimization
