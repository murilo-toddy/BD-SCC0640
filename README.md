# SCC0640 --- Bases de Dados

Repositório para o desenvolvimento do projeto da disciplina SCC0640, ministrada pela professora Elaine Parros.

## Dependências

Para testar o projeto, você precisa de:

- `Python 3.9.5`
- `Psycopg2 2.9.2`
- `Docker 20.10.11`
- `docker-compose 1.29.2`

O Psycopg2 pode ser adicionad através do `pip`, caso o tenha instalado:

```bash
pip install -r requirements.txt
```

## Makefile

### `up`

Inicia o *Postgres* dentro do *Docker container*.

### `bg`

Inicia o *Postgres* dentro do *Docker container* no *background*.

### `down`

Encerra o *Docker container* que está rodando o *Postgres*.

### `psql`

Abre o console interativo do Postgres dentro do container.

### `setup_db`

Reseta todas as tabelas do banco e as cria de novo.

### `app`

Executa a aplicação.

### `bootstrap`

Reseta todas as tabelas do banco, as recria e inicia a aplicação.

### `all`

Inicia o *Postgres* dentro do *Docker container* no *background*, reseta todas as tabelas do banco, as recria e inicia a aplicação.
