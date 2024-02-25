FROM alpine/curl:8.1.2 as digicert

WORKDIR /app

FROM quay.io/keycloak/keycloak:23.0.3

ADD themes/novasoftworks /opt/keycloak/themes/novasoftworks