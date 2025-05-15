# PostgreSQL + Flyway Migration System

## Features
- 🐳 PostgreSQL 15 in Docker  
- 🦅 Flyway for version-controlled migrations  
- 🔄 Zero-downtime migration support  
- ☁️ Terraform scripts for AWS deployment  

## Quick Start
```bash
docker-compose up -d
./scripts/migrate.sh
```

## Migration Management
### Add new migration
```bash
touch migrations/V2__Description.sql
./scripts/migrate.sh
```

### Check status
```bash
docker run --rm -v $(pwd)/migrations:/flyway/sql \
  --network host flyway/flyway:9 info \
  -url=jdbc:postgresql://localhost:5432/discord \
  -user=postgres -password=postgres
```

## Database Access
```bash
docker exec -it postgres-infra_postgres_1 psql -U postgres -d discord
```

## Cloud Deployment
```bash
cd terraform
terraform apply -var="db_password=your_password"
../scripts/deploy-to-cloud.sh
```

## Structure
```
migrations/       # Versioned SQL files
scripts/          # Migration helpers
terraform/        # AWS infrastructure
docker-compose.yml
```

## Troubleshooting
### Backup
```bash
docker exec -t postgres-infra-postgres-1 pg_dump -U postgres -d discord > backup.sql
```
### Restore
```bash
cat backup.sql | docker exec -i postgres-infra-postgres-1 psql -U postgres -d discord
```
