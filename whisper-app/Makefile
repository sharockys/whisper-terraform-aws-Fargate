run: 
	uvicorn app:app --reload --host 0.0.0.0 --port 8000 

test:
	curl -X POST -H "Content-Type: multipart/form-data" -F "audio_file=@audio.mp3" http://localhost:8000/transcribe

build:
	docker build -t haoxian/whisper-docker .

format: 
	black .
	isort .
	pylint app.py
	mypy app.py
