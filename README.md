# cbox

Ansible-based devbox provisioning for Chrome OS Linux VM (Debian 12 Bookworm, ARM64/aarch64).

## Quick Start

```bash
# Full setup (install Ansible, provision system, configure)
make

# Or run each stage individually:
make ansible    # Install Ansible
make install    # Provision the system (requires sudo)
make configure  # Configure git, SSH keys, GitHub CLI (interactive)

# Run tests
make test              # Unit tests only (fast, no sudo required)
make test-integration  # Full integration test (runs playbook + smoke tests)
```

## Philosophy

- **Version managers, not languages**: Ansible installs version managers (nvm, pyenv, rbenv, etc.). Languages are installed manually via these managers after provisioning.
- **Docker Engine 24.x+**: Uses docker-ce with Compose V2 plugin (`docker compose`, not the deprecated `docker-compose`).
- **Test-Driven Development**: Every role has unit tests (check Ansible task definitions) and smoke tests (verify actual installation).

## Project Structure

```
cbox/
├── playbook.yml          # Main Ansible playbook
├── roles/
│   ├── base/             # git, build-essential, cmake, etc.
│   ├── libraries/        # Development libraries (libssl-dev, etc.)
│   ├── networking/       # SSH, curl, wget, ufw, etc.
│   ├── utilities/        # htop, tmux, jq, tree, etc.
│   ├── databases/        # PostgreSQL, MySQL, Redis clients
│   ├── editors/          # vim, neovim, VS Code, ripgrep, etc.
│   ├── cloud/            # kubectl, helm, terraform, aws-cli, gcloud
│   ├── docker/           # Docker Engine with Compose V2
│   ├── nvm/              # Node.js version manager
│   ├── pyenv/            # Python version manager
│   ├── rbenv/            # Ruby version manager
│   ├── rustup/           # Rust toolchain manager
│   ├── goenv/            # Go version manager
│   └── sdkman/           # Java/JVM version manager
├── tests/
│   ├── test-*.sh         # Unit tests (check role definitions)
│   ├── smoke-*.sh        # Smoke tests (verify installations)
│   ├── run-unit.sh       # Run all unit tests
│   └── run-smoke.sh      # Run all smoke tests
├── Makefile              # Build automation
├── roadmap.md            # Complete list of installed software
└── CLAUDE.md             # AI assistant guidelines
```

## Roles

### System Packages (require sudo)

| Role | Description |
|------|-------------|
| base | Build essentials: git, gcc, cmake, pkg-config, autoconf |
| libraries | Dev libraries: libssl-dev, libffi-dev, zlib1g-dev, etc. |
| networking | SSH, curl, wget, ufw, net-tools, dnsutils, traceroute |
| utilities | System tools: htop, tmux, jq, tree, rsync, lsof, strace |
| databases | DB clients: postgresql-client, mysql-client, redis-tools, sqlite3 |
| editors | vim, neovim, nano, VS Code, ripgrep, fd-find, fzf, shellcheck |
| cloud | kubectl, helm, terraform, aws-cli, gcloud-cli, gh |
| docker | Docker Engine 29.x with Compose V2 plugin |

### User Packages (no sudo)

| Role | Description |
|------|-------------|
| nvm | Node.js version manager |
| pyenv | Python version manager with virtualenv plugin |
| rbenv | Ruby version manager with ruby-build plugin |
| rustup | Rust toolchain manager |
| goenv | Go version manager |
| sdkman | Java/JVM SDK manager |

## Installing Languages

After provisioning, install languages via their version managers:

```bash
# Node.js
nvm install --lts
nvm use --lts

# Python
pyenv install 3.12.0
pyenv global 3.12.0

# Ruby
rbenv install 3.3.0
rbenv global 3.3.0

# Go
goenv install 1.22.0
goenv global 1.22.0

# Rust (already installed by rustup)
rustup default stable

# Java
sdk install java
```

## Make Commands

| Command | Description |
|---------|-------------|
| `make` | Full setup: install Ansible, provision system, configure |
| `make ansible` | Install Ansible only |
| `make install` | Run playbook to provision system (requires sudo) |
| `make configure` | Interactive configuration: git user/email, SSH keys, GitHub CLI |
| `make test` | Run unit tests (fast, no installation required) |
| `make test-integration` | Full integration test (runs playbook + smoke tests) |

## Configuration Stage

After provisioning with `make install`, run `make configure` to set up:

- **Git user configuration**: Prompts for `user.name` and `user.email`, or keeps existing values
- **SSH key for GitHub**: Generates ED25519 key if needed, displays public key to add to GitHub
- **GitHub CLI authentication**: Checks if `gh` is authenticated

## Implementation Notes

### Helm Installation

The official Helm apt repository (`baltocdn.com`) experienced DNS resolution issues during development. Instead of using the apt repository, Helm is installed via the official install script:

```yaml
# roles/cloud/tasks/main.yml
- name: Install helm
  shell: |
    curl -fsSL https://raw.githubusercontent.com/helm/helm/main/scripts/get-helm-3 | bash
  args:
    creates: /usr/local/bin/helm
```

This approach is more reliable and installs Helm to `/usr/local/bin/helm`.

### AWS CLI Installation

The apt package for AWS CLI is typically outdated. AWS CLI v2 is installed via the official installer:

```yaml
- name: Install aws-cli
  shell: |
    cd /tmp
    curl -fsSL "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip"
    unzip -q -o awscliv2.zip
    ./aws/install --update
    rm -rf aws awscliv2.zip
  args:
    creates: /usr/local/bin/aws
```

### Docker Engine vs docker.io

The Debian `docker.io` package (v20.x) is outdated. This project uses Docker's official repository to install docker-ce (v29.x) with:
- Docker Engine
- Docker CLI
- containerd
- Docker Buildx plugin
- Docker Compose V2 plugin

Use `docker compose` (with space), not `docker-compose` (hyphenated).

### NVM Path

On this system, NVM installs to `~/.config/nvm` rather than the traditional `~/.nvm`. Scripts and shell configurations should use:

```bash
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
```

## Prerequisites

- Chrome OS Linux VM (Crostini) or Debian 12 Bookworm
- ARM64/aarch64 architecture
- Passwordless sudo configured

## License

MIT
