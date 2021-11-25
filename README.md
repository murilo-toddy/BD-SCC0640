# BD-SCC0640

Repositório para o desenvolvimento do projeto da disciplina SCC0640

Antes de inicializar o programa, é necessário criar um arquivo `.env` na raiz do projeto e setar a variável `POSTGRES_PASSWORD`. Por exemplo:
```bash
POSTGRES_PASSWORD="Z*T5L&!#N38%Q5P%w#R9LV55j5L#PxHSqcx"
```

Para iniciar o *Postgres* dentro do *Docker container* basta executar:
```bash
docker-compose up
```
e, para encerrá-lo:
```bash
docker-compose down
```

Para abrir o console interativo do Postgres dentro do container, execute:
```bash
docker exec -it bd-projeto_db_1 psql -U postgres
```
([fonte](https://stackoverflow.com/questions/37099564/docker-how-can-run-the-psql-command-in-the-postgres-container))
