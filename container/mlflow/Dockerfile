FROM python:3.12-slim-bookworm

RUN pip install mlflow[extras]

EXPOSE 5000

ENTRYPOINT ["mlflow", "server"]