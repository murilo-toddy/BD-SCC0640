start_db:
	docker-compose up

stop_db:
	docker-compose down

psql:
	docker exec -it bd-projeto-db psql -U postgres

setup_db:
	docker exec -it bd-projeto-db psql -U postgres -d postgres -f /db-scripts/setup-tables.sql

start_app:
	python3 src/app/main.py
