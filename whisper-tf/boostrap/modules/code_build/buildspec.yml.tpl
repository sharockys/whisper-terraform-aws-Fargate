version: 0.2

phases:
  install:
    commands:
      - echo Installing dependencies...
      - curl -sSL https://install.python-poetry.org | python3 -
      - /root/.local/bin/poetry install --all-extras
  pre_build:
    commands:
      - echo Running tests and linting...
      - /root/.local/bin/poetry run black --check .
      - echo Logging in to Amazon ECR...
      - aws ecr get-login-password --region ${region} | docker login --username AWS --password-stdin ${ecr_repository_url}
  build:
    commands:
      - echo Building the Docker image...
      - docker build -t whisper-app .
      - docker tag whisper-app:latest ${ecr_repository_url}:latest
  post_build:
    commands:
      - echo Pushing the Docker image...
      - docker push ${ecr_repository_url}:latest
