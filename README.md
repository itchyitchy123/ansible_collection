# `opsforge.linux`

[![CI](https://github.com/itchyitchy123/ansible_collection/actions/workflows/ci.yml/badge.svg)](https://github.com/itchyitchy123/ansible_collection/actions/workflows/ci.yml)

opsforge.linux — reusable Ansible roles and 37 playbooks for Linux provisioning, hardening, monitoring, and operations.

The CI compatibility baseline is Ubuntu 22.04 and AlmaLinux 9. Read the
[compatibility matrix](docs/compatibility.md) before using service roles: some
packages require an external vendor or EPEL repository.

## Install

```bash
ansible-galaxy collection install -r requirements.yml
ansible-galaxy collection build
ansible-galaxy collection install opsforge-linux-1.1.1.tar.gz
```

## Run

Copy `inventory.example.ini`, create an inventory group named `linux`, then run one playbook:

```bash
ansible-playbook -i inventory.ini playbooks/install_apache.yml
ansible-playbook -i inventory.ini playbooks/create_users.yml -e '{managed_users: [{name: alice, groups: sudo, ssh_key: "ssh-ed25519 ..."}]}'
ansible-playbook -i inventory.ini playbooks/deploy_wordpress.yml -e @wordpress-vault.yml --ask-vault-pass
```

All playbooks use privilege escalation and are independently runnable. Review variables in `roles/*/defaults/main.yml`; keep passwords in Ansible Vault.

## Playbooks

| Area | Playbooks |
|---|---|
| Web/database | `install_apache`, `install_nginx`, `install_mariadb`, `configure_php`, `deploy_wordpress`, `configure_redis`, `deploy_static_site` |
| Security/access | `configure_ssh`, `configure_firewall`, `harden_linux`, `create_users`, `configure_fail2ban`, `disable_root_login`, `configure_sudo`, `install_auditd`, `configure_selinux` |
| Containers/runtime | `install_docker`, `install_podman`, `install_nodejs`, `install_python` |
| Monitoring | `install_prometheus`, `configure_grafana`, `install_node_exporter`, `configure_rsyslog`, `configure_logrotate` |
| Operations | `setup_backups`, `configure_chrony`, `configure_hostname`, `configure_dns`, `configure_swap`, `configure_motd`, `install_base_packages`, `update_packages`, `configure_auto_updates`, `manage_services`, `mount_filesystems`, `configure_cron` |

See [docs/variables.md](docs/variables.md) for the main inputs and
[reference deployments](docs/reference-deployments.md) for safe invocation
patterns.
Each role documents its contract in `roles/<role>/README.md`.

## Development

Install the development dependencies and run the same checks used in CI:

```bash
python -m pip install -r requirements-dev.txt
ansible-galaxy collection install -r requirements.yml -p .ansible/collections
make yaml-lint lint syntax molecule
```

Molecule covers the `users`, `backups`, `hardening`, `ssh`, and `wordpress`
roles in Ubuntu 22.04 and AlmaLinux 9 containers. The remaining roles can be added
incrementally as their service-specific test requirements are defined.
