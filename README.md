# `opsforge.linux`

An Ansible Collection containing reusable Linux roles and **36 focused playbooks**. It supports Debian/Ubuntu and RHEL-family hosts unless a playbook says otherwise.

## Install

```bash
ansible-galaxy collection install -r requirements.yml
ansible-galaxy collection build
ansible-galaxy collection install opsforge-linux-1.0.0.tar.gz
```

## Run

Copy `inventory.example.ini`, create an inventory group named `linux`, then run one playbook:

```bash
ansible-playbook -i inventory.ini opsforge.linux.install_apache
ansible-playbook -i inventory.ini opsforge.linux.create_users -e '{managed_users: [{name: alice, groups: sudo, ssh_key: "ssh-ed25519 ..."}]}'
ansible-playbook -i inventory.ini opsforge.linux.deploy_wordpress --ask-vault-pass
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

See [docs/variables.md](docs/variables.md) for the main inputs.
