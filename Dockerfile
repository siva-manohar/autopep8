FROM python:3.10
WORKDIR /src
COPY . /src
RUN pip3 install -r requirements.txt
EXPOSE 4000
CMD ["python3","src/autopep8.py"]
