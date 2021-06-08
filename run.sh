#!/usr/bin/env bash

PUBLIC_IP=$(curl ipinfo.io/ip)

echo "${PUBLIC_IP}"

PAYLOAD="{ \"ip\": \"${PUBLIC_IP}\" }"

aws lambda invoke --function-name "${FUNCTION_NAME}" --payload "${PAYLOAD}" response.json
