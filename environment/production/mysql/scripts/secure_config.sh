#!/bin/bash
set -e

# Aguarda o MariaDB estar totalmente iniciado

echo "MariaDB iniciado com sucesso."

echo "Aplicando configurações de segurança..."

# Executa os comandos SQL para:
# - Permitir que o root seja acessível de qualquer host e atualizar sua senha para svJC002025@#$
# - Criar o usuário jefte com a senha svJC002025@#$, com todos os privilégios e capacidade de criar outros usuários
mysql -uroot -p"$MYSQL_ROOT_PASSWORD" <<-EOSQL
    -- Permitir acesso de qualquer host ao usuário root e atualizar sua senha
    UPDATE mysql.user SET Host='%' WHERE User='root';
    ALTER USER 'root'@'%' IDENTIFIED BY 'svJC002025@#$';

    -- Criação do usuário 'jefte' acessível de qualquer host com todos os privilégios e com opção de repassar privilégios
    CREATE USER IF NOT EXISTS 'jefte'@'%' IDENTIFIED BY 'svJC002025@#$';
    GRANT ALL PRIVILEGES ON *.* TO 'jefte'@'%' WITH GRANT OPTION;

    FLUSH PRIVILEGES;
EOSQL
echo "Configurações aplicadas com sucesso!"