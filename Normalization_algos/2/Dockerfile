FROM python:3.7

VOLUME /data
WORKDIR /app

RUN touch input.txt
RUN touch output.txt

COPY requirements.txt /app

RUN pip install -r requirements.txt

COPY normalize.py /app

CMD ["python3", "normalize.py"]