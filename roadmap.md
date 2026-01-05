# Devbox Roadmap

## Philosophy
- Version managers installed via Ansible (nvm, pyenv, rbenv, rustup, goenv, sdkman)
- Languages installed manually via version managers after provisioning
- Docker Engine 24.x+ with Compose V2 plugin (`docker compose`, not `docker-compose`)

## Build Essentials
- [x] git (2.39.5)
- [x] build-essential (gcc 12.2.0, g++, make, libc-dev)
- [x] cmake (3.25.1)
- [x] pkg-config (1.8.1)
- [x] autoconf (2.71) / automake / libtool

## System Libraries
- [x] libssl-dev
- [x] libffi-dev
- [x] zlib1g-dev
- [x] libreadline-dev
- [x] libbz2-dev
- [x] libsqlite3-dev
- [x] libncurses-dev
- [x] libxml2-dev
- [x] libxslt1-dev
- [x] libyaml-dev

## Networking & Security
- [x] openssh-client
- [x] openssh-server
- [x] curl
- [x] wget
- [x] ca-certificates
- [x] gnupg
- [x] ufw
- [x] net-tools
- [x] dnsutils
- [x] iputils-ping
- [x] traceroute

## System Utilities
- [x] cron
- [x] htop
- [x] tmux
- [x] jq
- [x] tree
- [x] unzip
- [x] zip
- [x] rsync
- [x] lsof
- [x] strace

## Database Clients
- [x] postgresql-client
- [x] mysql-client (default-mysql-client)
- [x] redis-tools
- [x] sqlite3

## Editor & Dev Tools
- [x] vim (9.0)
- [x] neovim (0.7.2)
- [x] nano (7.2)
- [x] code (VS Code 1.107.1)
- [x] ripgrep (13.0.0)
- [x] fd-find
- [x] fzf
- [x] shellcheck

## Container & Cloud Tools
- [x] docker-ce (29.1.3) with docker-compose-plugin (5.0.1)
- [x] kubectl (1.31.14)
- [x] helm (3.19.4)
- [x] terraform (1.14.3)
- [x] aws-cli (2.32.28)
- [x] gcloud-cli (550.0.0)
- [x] gh (GitHub CLI 2.83.2)

## Language Version Managers
Ansible installs version managers only. Install languages manually after provisioning.

| Manager | Version | Install Language |
|---------|---------|------------------|
| nvm | 0.40.1 | `nvm install --lts` |
| pyenv | 2.6.17 | `pyenv install 3.x.x` |
| rbenv | 1.3.2 | `rbenv install 3.x.x` |
| goenv | 2.2.34 | `goenv install 1.x.x` |
| rustup | 1.28.2 | `rustup default stable` |
| sdkman | 5.20.0 | `sdk install java` |
