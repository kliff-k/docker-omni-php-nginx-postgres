# Imagem inicial baseda em Debian (Testing)
FROM debian:testing

# Atualiza o repositório e instala os serviços necessários (nginx, postgresql, supervisor, composer, php + modulos)
RUN apt update --yes && apt install nginx php-fpm php-pgsql composer postgresql supervisor --yes

# Cria as pastas necessárias para a gerencia dos serviços
RUN mkdir -p /var/log/supervisor && mkdir -p /etc/supervisor/conf.d && mkdir -p /var/run/php && mkdir /var/www/config

# Copia o aplicativo e os arquivos de configuração para o container
COPY ./sql/* /tmp
COPY ./web/* /var/www/html/
COPY ./config/supervisor.conf /etc/supervisor.conf
COPY ./config/nginx.conf /etc/nginx/sites-available/default

# Inicializa o banco de dados
RUN service postgresql start

# Gera uma senha para o usuário do aplicativo no banco, guarda no arquivo designado e constroi a estrutura do banco
RUN export BDPWD=$(openssl rand -base64 32) && echo $BDPWD > /var/www/config/dbpwd && sed -i "s@AFTERSALE_PWD@$BDPWD@g" /tmp/ddl.sql && su - postgres -c "psql -f /tmp/ddl.sql"

# Limpa o container de arquivos e pacotes desnecessários
RUN rm /tmp/ddl.sql

# Inicializa o Supervisor que gerenciará os serviços do container
CMD ["supervisord", "-c", "/etc/supervisor.conf"]
