# Define service names
APP_NAME=fintech-transaction-system
DOCKER_COMPOSE=docker compose

# Build and run the containers
up:
	$(DOCKER_COMPOSE) up --build -d

# Stop and remove containers
down:
	$(DOCKER_COMPOSE) down

# View logs from the application
logs:
	$(DOCKER_COMPOSE) logs -f app

# Rebuild the application without cache
rebuild:
	$(DOCKER_COMPOSE) build --no-cache

# Remove unused images and volumes
clean:
	docker system prune -af --volumes
