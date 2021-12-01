start:
	docker-compose up

psql:
	docker exec -it bd-scc0640_db_1 psql -U postgres

update:
	docker cp ./src/db bd-scc0640_db_1:/db