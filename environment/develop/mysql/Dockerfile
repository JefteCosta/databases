# Use a imagem oficial do MariaDB na versão 11
FROM mariadb:11

# Copia o script de configuração de segurança para o diretório
# de inicialização da imagem. Qualquer script presente em
# /docker-entrypoint-initdb.d/ será executado na primeira inicialização.
COPY scripts/secure_config.sh /docker-entrypoint-initdb.d/

# Garante que o script tenha permissão de execução
RUN chmod +x /docker-entrypoint-initdb.d/secure_config.sh

# Copia o entrypoint customizado
COPY scripts/custom-entrypoint.sh /usr/local/bin/custom-entrypoint.sh
RUN chmod +x /usr/local/bin/custom-entrypoint.sh

# Define o entrypoint customizado
ENTRYPOINT ["custom-entrypoint.sh"]

# Comando padrão para iniciar o mysqld
CMD ["mysqld"]