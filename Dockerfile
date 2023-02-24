
# For more information, please refer to https://aka.ms/vscode-docker-python
FROM python:3.10.0
ENV PYTHONUNBUFFERED=1
COPY requirements.txt /Moderator/requirements.txt
RUN pip install -r /Moderator/requirements.txt
COPY . /Moderator
WORKDIR /Moderator
RUN adduser -u 5678 --disabled-password --gecos "" appuser && chown -R appuser /Moderator
USER appuser
CMD ["python", "main.py"]
