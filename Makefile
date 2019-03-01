# convenience makefile

.PHONY: deployments
deployments:
	@kubectl create -f deployments

.PHONY: services
services:
	@kubectl create -f services

.PHONY: storage
storage:
	@kubectl create -f storage

.PHONY: secrets
secrets:
	@kubectl create -f secrets

.PHONY: deploy
deploy: deployments services secrets storage

.PHONY: destroy
destroy:
	@kubectl delete deploy,svc,pvc -l app=blog
	@kubectl delete secret mysql-secret
