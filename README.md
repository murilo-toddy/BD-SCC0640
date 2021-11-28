# SCC0640 --- Bases de Dados

Repositório para o desenvolvimento do projeto da disciplina SCC0640, ministrada pela professora Elaine Parros.

## Makefile

### `start_db`

Inicia o *Postgres* dentro do *Docker container*.

### `stop_db`

Encerra o *Docker container* que está rodando o *Postgres*.

### `psql`

Abre o console interativo do Postgres dentro do container.

### `setup_db`

Reseta todas as tabelas do banco e as cria de novo.

### `start_app`

Executa a aplicação.

## PG Admin

Para acessar a interface gráfica do *Postgres* (pgadmin), basta entrar entrar no endereço [http://localhost:5050/browser/](http://localhost:5050/browser/). Par a autenticação, utilize:

- *Email*: admin@admin.com
- *Password*: root

Conecte ao banco de dados usando:

- *Host*: localhost
- *Database*: postgres
- *User*: postgres
- *Password*: admin
