#!/bin/bash
set -e



# Executa o entrypoint original do MariaDB
exec docker-entrypoint.sh "$@"

echo "Executando script de segurança..."
# Executa o script de segurança
/docker-entrypoint-initdb.d/secure_config.sh