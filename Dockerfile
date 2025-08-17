FROM python:3.10
COPY . .
RUN pip3 install -r requirements.txt
EXPOSE 4000
CMD ["python3","autopep8.py"]
