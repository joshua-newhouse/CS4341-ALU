FROM python:latest                             

ADD . /app
WORKDIR /app

RUN apt-get update && apt-get install iverilog
RUN pip3 install flask

EXPOSE 5000

CMD ["python3", "gui.py"]
