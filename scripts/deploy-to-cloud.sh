#!/bin/bash

# Initialize Terraform
cd terraform
terraform init

# Apply Terraform configuration
terraform apply -auto-approve -var="db_password=${DB_PASSWORD}"

# Get database endpoint
DB_ENDPOINT=$(terraform output -raw db_endpoint)

# Apply migrations to cloud database
docker run --rm \
  -v $(pwd)/../migrations:/flyway/sql \
  flyway/flyway:9 \
  -url=jdbc:postgresql://${DB_ENDPOINT}/${POSTGRES_DB:-discord} \
  -user=${POSTGRES_USER:-postgres} \
  -password=${DB_PASSWORD} \
  -connectRetries=60 \
  migrate

echo "Database deployed and migrations applied to ${DB_ENDPOINT}"
