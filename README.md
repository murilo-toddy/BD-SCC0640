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
docker exec -it bd-scc0640_db_1 psql -U postgres
```
([fonte](https://stackoverflow.com/questions/37099564/docker-how-can-run-the-psql-command-in-the-postgres-container))

Para acessar a interface gráfica do *Postgres* (pgadmin), basta entrar entrar no endereço `http://localhost:5050/browser/` e autenticar com as informações do docker-compose.

Caso não exista, criar um servidor genérico e em seguida um database com nome `scc0640`. As tabelas criadas podem ser encontradas em `scc0640/Schemas/public/Tables`

Para executar arquivos `.sql` pelo docker, é necessário criar uma cópia do arquivo para o ambiente

```sudo
docker cp ./dir/filename.sql bd-scc0640_db_1:/dir/filename.sql
```

Vale ressaltar que o endereço do arquivo no docker não precisa ser o mesmo que o local

Em seguida, pode-se executar o arquivo iniciando o `psql` (o endereço deve corresponder ao endereço do docker)

```sudo
docker exec -it bd-scc0640_db_1 psql -U postgres -d scc0640 -f /dir/filename.sql
```

ou pela própria linha de comando `psql`, através de:

```\i
dir/filename.sql
```
