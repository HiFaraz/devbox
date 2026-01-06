.PHONY: all ansible install configure test test-integration
all: ansible install configure

ansible:
	./install-ansible.sh

install:
	ansible-playbook playbook.yml

configure:
	./configure.sh

test:
	./test-install-ansible.sh
	./test-makefile.sh
	./test-playbook.sh
	./tests/run-unit.sh

test-integration:
	./test-integration.sh
	./tests/run-smoke.sh
