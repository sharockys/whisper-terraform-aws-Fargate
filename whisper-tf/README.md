# Terraform Whisper APP Deployment with AWS ECS Fargate  
This project is a collection of scripts and configuration files to deploy the Whisper ML application on aws. 

## Overview
There are two main components to the Whisper ML deployment project:
1. Bootstrap - The bootstrap script is used to provision the infrastructure required to build the whisper app docker image. 
2. Deployment - The deployment script is used to provision the infrastructure required to run the Whisper APP. 

## Pre-requisites
- Terraform
- AWS account configured with necessary permissions
- AWS CLI
- Terraform Cloud (Optional, but changes need to be made to the main.tf files to use local state files, or other remote state backend). The deployment script is configured to use outputs from the bootstrap project and will not work without it. ( For ECR and S3 bucket names) 

## Installation
- Clone the repo

### Bootstrap
```bash 
cd bootstrap
terraform init
terraform plan -out bootstrap.tfplan 
terraform apply bootstrap.tfplan
```

### Push code to Code Commit
```bash
git init
git add .
git commit -m "first commit"
git remote add origin <codecommit repo url from bootstrap output>
git push -u origin main
```
Then you will have to trigger the Code Build Pipeline manually from the AWS console.
Visit the Code Build console and select the build project. Click on Start Build.

Finally go to the ECR console to check that the docker image has been pushed to the ECR repository.

### Deployment
Again, the deployment part is configured to use outputs from the bootstrap project with remote state and will not work without it. ( For mainly for ECR) When you change to another backend, make sure to retreive the ECR repository name from the bootstrap project and update the main.tf file in the deployment folder. ( you can also pass it as variable)
```bash
cd deployment
terraform init
terraform plan -out deployment.tfplan
terraform apply deployment.tfplan
```

Now you may checkout the `dns_name` output from the deployment project and visit the url to test the app. 
```bash
curl -X POST -H "Content-Type: multipart/form-data" -F "audio_file=@audio.mp3" http://<DNS_NAME>/transcribe
``` 
or you can open your browser and visit the url to test the app. 
`http://<DNS_NAME>/docs` 
