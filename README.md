# After Sale Skill Challenge 
Solução em Docker para o desafio de habilidade da After Sale.
A imagem contém toda o sistema de forma unificada, para facilidade de deployment e uso.

## Overview
Os seguintes serviços são utilizados pela ferramenta:

* Web server (Nginx)
* PHP (PHP 7.4 with PHP-FPM)
* Database (PostgreSQL 13)

## Pré requisitos
O sistema só depende do Docker, mas pode utilizar o Compose para maior facilidade com o startup.

* [Docker CE](https://docs.docker.com/engine/installation/)
* [Docker Compose](https://docs.docker.com/compose/install) (opcional)
* Git (opcional)

## Como usar
Clone o projeto, mova para o diretório e execute `docker build -t aftersale .`.
Após a construção da imagem, inicie o container com `docker run -d -p 80:80 --name aftersale aftersale`.
A API estará disponível na porta 80, assim como o swagger com suas especificações.

Caso o ambiente tenha o Docker Compose disponível, basta executar `docker-compose up -d`.
