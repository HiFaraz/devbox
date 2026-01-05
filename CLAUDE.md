# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a system provisioning project using Ansible playbooks to install and configure software.

## Commands

- `make` - runs install-ansible.sh to install Ansible
- `make test` - runs unit tests (fast, no side effects)
- `make test-integration` - runs playbook and smoke tests actual installations

## Pattern: Adding New Software

When adding a new package to install:

1. Add a task to `playbook.yml` using the apt module
2. Add a smoke test to `test-integration.sh` that verifies the installation (e.g., `<tool> --version`)

## Testing Structure

- `test-*.sh` - unit tests that check file existence and content
- `test-integration.sh` - runs the playbook and verifies installations with smoke tests
