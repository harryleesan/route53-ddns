FROM python:3.9-alpine
LABEL description="An utility image that checks for changes to image tags in AWS ECR."

RUN apk upgrade --update

RUN apk add \
    bash \
    curl \
    groff \
    jq

RUN pip install --upgrade pip \
    awscli

WORKDIR /app

COPY run.sh /app/run.sh
RUN chmod +x /app/run.sh

ENV FUNCTION_NAME ""

CMD ["bash", "-c", "/app/run.sh"]
