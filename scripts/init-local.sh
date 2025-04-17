#!/bin/bash

# Set environment variables
export POSTGRES_USER=postgres
export POSTGRES_PASSWORD=postgres
export POSTGRES_DB=discord

# Start containers
docker-compose up -d

echo "PostgreSQL is running on port 5432"
echo "Flyway will automatically apply migrations"
