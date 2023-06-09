FROM python:3.9
WORKDIR /code
RUN apt update && apt install -y python3-dev \
                        gcc \
                        libc-dev \
                        ffmpeg

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY . /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]