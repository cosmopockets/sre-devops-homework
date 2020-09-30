.DEFAULT_GOAL := help

build:
	docker build -t test .

help: ## display this help section
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z0-9_-]+:.*?## / {printf "\033[36m%-38s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)

docker-login: ## authenticate with github package registry
	@( test ! -z "$REEL_GIT_USERNAME" && test ! -z "$REEL_GIT_TOKEN" ) || (echo "WARNING: REEL_GIT_USERNAME and REEL_GIT_TOKEN must be defined" && exit 1)
	@docker login docker.pkg.github.com -u ${REEL_GIT_USERNAME} -p ${REEL_GIT_TOKEN}


clean-all: ## remove all tfplan, state files and .terraform dirs
	rm -rf modules/
	find . -type f -iname tfplan -delete
	find . -type f -iname terraform.tfstate* -delete
	find . -type d -iname .terraform -exec rm -rf {} \;

start-docker-compose: ## start docker-compose localstack service
	docker-compose up --quiet-pull

stop-docker-compose: ## stop and teardown docker-compose
	docker-compose down

start-local-docker-compose: ## start docker-compose localstack service
	docker-compose -f docker-compose.local.yml up --quiet-pull

stop-local-docker-compose: ## stop and teardown docker-compose
	docker-compose -f docker-compose.local.yml down

plan: validate
	terraform plan --out tfplan

apply: plan
	terraform apply tfplan

destroy:
	terraform destroy -auto-approve

clean:
	find . -name "tfplan" -delete
	find . -name "terraform.tfstate.*" -delete
	rm -rf .terraform/

validate:
	terraform validate