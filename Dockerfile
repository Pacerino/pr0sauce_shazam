FROM python:3.9
WORKDIR /code

RUN apk update && apk add python3-dev \
                        gcc \
                        libc-dev

COPY ./requirements.txt /code/requirements.txt


RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt


COPY ./app /code/app


CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]