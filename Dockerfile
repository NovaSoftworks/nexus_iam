FROM alpine/curl:8.1.2 as digicert

WORKDIR /app

# We need to allow Keycloak to access Azure Flexible PostgreSQL servers, which requires that we add this certificate to Keycloak's truststore
RUN curl https://dl.cacerts.digicert.com/DigiCertGlobalRootCA.crt.pem -o DigiCertGlobalRootCA.crt.pem

FROM quay.io/keycloak/keycloak:23.0.3
COPY --from=digicert /app/DigiCertGlobalRootCA.crt.pem /opt/keycloak/.postgresql/root.crt