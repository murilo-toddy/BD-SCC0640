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
```bash
\i dir/filename.sql
```

## Queries

1. Quais são as pessoas de cada curso que vão mais em festas
    * Apenas as pessoas com maior quantidade de festas
    * Últimos 6 meses
    * Contexto: imobiliária quer saber quais as pessoas mais populares/sociáveis pra contratar como influenciadores
2. Todos os alunos e, caso eles sejam orientados por algum professor, os dados do professor.
    * Junção externa
    * Contexto: um professor do instituto de Sociologia da USP está empreendendo uma pesquisa **revolucionária** para descobrir a relação entre um aluno estar sendo orientado por um professor e estar ou não procurando moradia/imóvel.
3. Dada uma festa, verificar quantos moradores existem em uma moradia na data da festa.
4. Quais são os campus com maior probabilidade de ter animais passeando neles
    * Provavelmente, consulta aninhada correlacionada e agrupamento
    * Pegar a cidade dos campus, varrer a tabela de moradia e verificar quais tem "Quantidade de animais"
5. Quais são os alunos que estão há mais tempo na faculdade e estão há procurar de moradia ou imóvel?
    * Consulta aninhada não-correlacionada
6. Quais são todas as pessoas que já moraram em uma moradia e nunca foram a uma festa?
    * Verificar se nunca comprou ingresso e se as moradias que já morou nunca deram festa
    * Contexto: a seção de bem-estar da USP busca entender quais pessoas podem estar deslocadas
7. Quais são os alunos que foram em todas as palestras de um determinado professor e não são orientados por nenhum ainda?
    * Divisão
    * Palestras no último ano
    * Contexto: o professor está procurando um orientando e quer um aluno bem engajado e interessado
