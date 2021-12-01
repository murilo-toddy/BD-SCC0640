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

## Queries

1. Quais são as pessoas de cada curso que vão mais em festas
    a. Apenas as pessoas com maior quantidade de festas
    b. Últimos 6 meses
    c. Contexto: imobiliária quer saber quais as pessoas mais populares/sociáveis pra contratar como influenciadores
2. Todos os alunos e, caso eles sejam orientados por algum professor, os dados do professor.
    a. Junção externa
    b. Contexto: um professor do instituto de Sociologia da USP está empreendendo uma pesquisa **revolucionária** para descobrir a relação entre um aluno estar sendo orientado por um professor e estar ou não procurando moradia/imóvel.
3. Dada uma festa, verificar quantos moradores existem em uma moradia na data da festa.
4. Quais são os campus com maior probabilidade de ter animais passeando neles
    a. Provavelmente, consulta aninhada correlacionada e agrupamento
    b. Pegar a cidade dos campus, varrer a tabela de moradia e verificar quais tem "Quantidade de animais"
5. Quais são os alunos que estão há mais tempo na faculdade e estão há procurar de moradia ou imóvel?
    a. Consulta aninhada não-correlacionada
6. Quais são todas as pessoas que já moraram em uma moradia e nunca foram a uma festa?
    a. Verificar se nunca comprou ingresso e se as moradias que já morou nunca deram festa
    b. Contexto: a seção de bem-estar da USP busca entender quais pessoas podem estar deslocadas
7. Quais são os alunos que foram em todas as palestras de um determinado professor e não são orientados por nenhum ainda?
    a. Divisão
    b. Palestras no último ano
    c. Contexto: o professor está procurando um orientando e quer um aluno bem engajado e interessado
