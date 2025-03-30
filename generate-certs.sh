#!/bin/bash

# Create certs directory
CERTS_DIR="./certs"
mkdir -p $CERTS_DIR

# Generate CA certificate
openssl genrsa -out $CERTS_DIR/ca-key.pem 4096
openssl req -x509 -new -nodes -key $CERTS_DIR/ca-key.pem -sha256 -days 365 -out $CERTS_DIR/ca-cert.pem -subj "/CN=Redis-Cluster-CA"

# Generate server certificate
openssl genrsa -out $CERTS_DIR/server-key.pem 2048
openssl req -new -key $CERTS_DIR/server-key.pem -out $CERTS_DIR/server.csr -subj "/CN=redis-server"
openssl x509 -req -in $CERTS_DIR/server.csr -CA $CERTS_DIR/ca-cert.pem -CAkey $CERTS_DIR/ca-key.pem -CAcreateserial -out $CERTS_DIR/server-cert.pem -days 365 -sha256

# Generate client certificate
openssl genrsa -out $CERTS_DIR/client-key.pem 2048
openssl req -new -key $CERTS_DIR/client-key.pem -out $CERTS_DIR/client.csr -subj "/CN=redis-client"
openssl x509 -req -in $CERTS_DIR/client.csr -CA $CERTS_DIR/ca-cert.pem -CAkey $CERTS_DIR/ca-key.pem -CAcreateserial -out $CERTS_DIR/client-cert.pem -days 365 -sha256

# Clean up CSR files
rm $CERTS_DIR/*.csr

# Set permissions
chmod 600 $CERTS_DIR/*.pem

echo "Certificates generated in $CERTS_DIR"
