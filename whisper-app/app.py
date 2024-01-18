"""
This module contains the FastAPI application for the Whisper app.
To run the app, use the following command:
    make run 
The app will be available at http://localhost:8000.
The doc of the API will be available at http://localhost:8000/docs 
"""

from typing import Any, BinaryIO, Dict, List

import uvicorn
from fastapi import FastAPI, UploadFile
from faster_whisper import WhisperModel  # type: ignore
from loguru import logger
from pydantic import BaseModel, Field

app = FastAPI()
MODEL_SIZE = "base"

model = WhisperModel(MODEL_SIZE, device="cpu", compute_type="int8")


class TranscriptionResponse(BaseModel):
    """
    This class represents the response of the transcription endpoint
    """

    metadata: Dict = Field(
        examples=[
            {
                "metadata": {
                    "language": "fr",
                    "probability": 0.9999,
                },
            }
        ]
    )
    transcription: List = Field(
        examples=[
            [
                {
                    "start": 0.0,
                    "end": 4.0,
                    "text": "je suis un chat",
                },
                {
                    "start": 4.01,
                    "end": 8.0,
                    "text": "je suis un chien",
                },
            ]
        ]
    )


def stt_inference(audio: BinaryIO) -> Dict[str, Dict[str, Any]]:
    """
    Transcribes the audio file and returns the result
    in the format of a dictionary.

    Args:
        audio (BinaryIO): The audio file to transcribe.
    Returns:
        Dict[str, Any]: The transcription result of format:
            {
                "metadata": {
                    "language": str,
                    "probability": float,
                },
                "transcription": [
                    {
                        "start": float,
                        "end": float,
                        "text": str,
                    },
                    ...
                ]
            }
    """
    segments, info = model.transcribe(audio, beam_size=5)
    result: Dict[str, Any] = {
        "metadata": {},
        "transcription": [],
    }
    result["metadata"] = {
        "language": info.language,
        "probability": info.language_probability,
    }
    logger.debug(
        f"Detected language '{info.language}' with probability {info.language_probability}"
    )

    for segment in segments:
        logger.debug(f"[{segment.start}s -> {segment.end}s] {segment.text}")
        result["transcription"].append(
            {"start": segment.start, "end": segment.end, "text": segment.text}
        )

    return result


@app.post(
    "/transcribe",
    response_model=TranscriptionResponse,
    response_model_include={"metadata", "transcription"},
)
async def transcribe(audio_file: UploadFile) -> Dict[str, Dict[str, Any]]:
    """
    Transcribes the audio file and returns the result.

    Args:
        audio_file (bytes): The audio file to transcribe.

    Returns:
        Dict[str, Any]: The transcription result of json format:
            {
                "metadata": {
                    "language": str,
                    "probability": float,
                },
                "transcription": [
                    {
                        "start": float,
                        "end": float,
                        "text": str,
                    },
                    ...
                ]
            }
    """
    result = stt_inference(audio_file.file)
    return result


if __name__ == "__main__":
    uvicorn.run(app, host="0.0.0.0", port=8000)
