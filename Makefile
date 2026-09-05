.PHONY: lint yaml-lint syntax molecule build

COLLECTION_PATH := $(CURDIR)/.ansible/collections
COLLECTION_VERSION := $(shell awk '/^version:/ { print $$2; exit }' galaxy.yml)
COLLECTION_ARTIFACT := $(CURDIR)/.ansible/build/opsforge-linux-$(COLLECTION_VERSION).tar.gz

lint:
	ansible-lint --offline

yaml-lint:
	yamllint -c .yamllint .

syntax:
	@mkdir -p .ansible/build .ansible/collections
	ansible-galaxy collection build --force --output-path .ansible/build
	ansible-galaxy collection install --force $(COLLECTION_ARTIFACT) -p .ansible/collections
	@ANSIBLE_COLLECTIONS_PATHS=$(COLLECTION_PATH) sh -c 'for p in playbooks/*.yml; do ansible-playbook --syntax-check -i inventory.example.ini "$$p"; done'

molecule: syntax
	@for scenario in backups hardening ssh users wordpress; do molecule test -s $$scenario || exit $$?; done
build:
	ansible-galaxy collection build --force
