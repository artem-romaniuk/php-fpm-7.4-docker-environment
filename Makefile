docker-build: memory
	docker-compose up --build -d

docker-up: memory
	docker-compose up -d

docker-status: memory
	docker-compose ps

docker-down:
	docker-compose down

%:
	docker-compose exec $@ bash

memory:
	sudo sysctl -w vm.max_map_count=262144


# Laravel commands
composer-install:
	docker-compose exec php composer install --ignore-platform-reqs

composer-update:
	docker-compose exec php composer update --ignore-platform-reqs

migrate:
	docker-compose exec php php artisan migrate

queue:
	docker-compose exec php php artisan queue:work

permission:
	sudo chown -R $(USER) www
	cd www && sudo chgrp -R www-data storage bootstrap/cache
	cd www && sudo chmod -R ug+rwx storage bootstrap/cache
