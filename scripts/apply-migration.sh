#!/bin/bash

# Apply new migrations
docker-compose run --rm flyway migrate
