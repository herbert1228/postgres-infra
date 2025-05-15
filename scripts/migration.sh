#!/bin/bash

# Apply migrations using one-off Flyway container
docker run --rm \
  -v $(pwd)/migrations:/flyway/sql \
  --network host \
  flyway/flyway:9 \
  -url=jdbc:postgresql://localhost:5432/${POSTGRES_DB:-discord} \
  -user=${POSTGRES_USER:-postgres} \
  -password=${POSTGRES_PASSWORD:-postgres} \
  migrate