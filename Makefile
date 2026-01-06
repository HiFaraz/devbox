.PHONY: all ansible install test test-integration
all: ansible install

ansible:
	./install-ansible.sh

install:
	ansible-playbook playbook.yml

test:
	./test-install-ansible.sh
	./test-makefile.sh
	./test-playbook.sh
	./tests/run-unit.sh

test-integration:
	./test-integration.sh
	./tests/run-smoke.sh
