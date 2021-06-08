FROM python:3.9-slim
LABEL description="An utility image that checks for set the Route53 record to public ip of the kubernetes cluster."

# RUN apk upgrade --update
#
# RUN apk add \
    # bash \
    # curl \
    # groff \
    # jq

RUN apt-get update && \
    apt-get install -y \
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
