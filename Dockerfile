FROM python:3.9-slim
 
ENV FLASK_APP=comment.py 

WORKDIR /app

COPY requirements.txt requirements.txt

RUN pip3 install -r requirements.txt

COPY . /app

EXPOSE 8080

CMD [ "python3", "-m" , "flask", "run", "--host=0.0.0.0","--port=5000"] 