start_db:
	docker-compose up

psql:
	docker exec -it bd-projeto-db psql -U postgres

setup_db:
	docker exec -it bd-projeto-db psql -U postgres -d postgres -f /db-scripts/setup-tables.sql

start_app:
	cd src/app && python3 main.py
