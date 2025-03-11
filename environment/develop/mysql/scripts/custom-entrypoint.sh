#!/bin/bash
set -e

echo "Executando script de segurança..."
# Executa o script de segurança
/docker-entrypoint-initdb.d/secure_config.sh

# Executa o entrypoint original do MariaDB
exec docker-entrypoint.sh "$@"