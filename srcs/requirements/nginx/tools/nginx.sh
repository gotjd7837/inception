#!/bin/bash

openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
  -keyout "/etc/ssl/private/nginx-selfsigned.key" \
  -out "/etc/ssl/certs/nginx-selfsigned.crt" \
  -subj "/C=KR/L=Seoul/O=42seoul/OU=STUDENT/CN=haekang.42.fr"

# Nginx 설정 파일에 SSL 인증서 경로 추가
echo "
ssl_certificate /etc/ssl/certs/nginx-selfsigned.crt;
ssl_certificate_key /etc/ssl/private/nginx-selfsigned.key;
" > /etc/nginx/snippets/self-signed.conf

nginx -g "daemon off;"
