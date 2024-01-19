# For more information, please refer to https://aka.ms/vscode-docker-python
FROM public.ecr.aws/docker/library/python:3.10.13-slim

EXPOSE 8000

# Keeps Python from generating .pyc files in the container
ENV PYTHONDONTWRITEBYTECODE=1

# Turns off buffering for easier container logging
ENV PYTHONUNBUFFERED=1

# ENV for huggingface models 
ENV HF_HOME /root/.cache/huggingface

# Install pip requirements
WORKDIR /app
COPY ./* /app/
RUN pip install --no-cache-dir .

# Creates a non-root user with an explicit UID and adds permission to access the /app folder
# For more info, please refer to https://aka.ms/vscode-docker-python-configure-containers
RUN adduser -u 1000 --disabled-password --gecos "" appuser && chown -R appuser /app
USER appuser

# During debugging, this entry point will be overridden. For more information, please refer to https://aka.ms/vscode-docker-python-debug
CMD ["uvicorn", "--port", "8000", "--host", "0.0.0.0", "app:app"]
