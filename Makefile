start:
	sudo docker-compose up

psql:
	sudo docker exec -it bd-scc0640_db_1 psql -U postgres

update:
	sudo docker cp ./src/db bd-scc0640_db_1:/db