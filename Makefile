.PHONY: lint syntax build
lint:
	ansible-lint
syntax:
	for p in playbooks/*.yml; do ansible-playbook --syntax-check -i localhost, "$$p"; done
build:
	ansible-galaxy collection build --force
