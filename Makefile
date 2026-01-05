.PHONY: all test test-integration
all:
	./install-ansible.sh

test:
	./test-install-ansible.sh
	./test-makefile.sh
	./test-playbook.sh
	./tests/run-unit.sh

test-integration:
	./test-integration.sh
	./tests/run-smoke.sh
