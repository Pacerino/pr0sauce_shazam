import uvicorn
from fastapi import Depends
from fastapi import FastAPI
from fastapi import File
from fastapi import UploadFile

from shazamio import Shazam

app = FastAPI()


def get_shazamio():
    shazam = Shazam()
    yield shazam


@app.post("/recognize")
async def recognize_file(
    shazam_service: Shazam = Depends(get_shazamio), file: UploadFile = File(...)
):
    out = await shazam_service.recognize_song(await file.read())
    return out


if __name__ == '__main__':
    uvicorn.run(app)