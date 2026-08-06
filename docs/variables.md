# Variables

Role defaults are safe starting points and are the source of truth. Important inputs include:

- `managed_users`: list of users with `name`, optional `groups`, `shell`, and `ssh_key`.
- `ssh_port`, `ssh_permit_root_login`, `ssh_password_authentication`.
- `firewall_allowed_tcp_ports`; SSH is included by default.
- `wordpress_db_password` and `mariadb_root_password`: store these in Ansible Vault.
- `backup_sources`, `backup_destination`, `backup_schedule`.
- `prometheus_package_name` and `grafana_package_name` allow distribution-specific package overrides.

Example vaulted variables:

```yaml
mariadb_root_password: !vault |
  $ANSIBLE_VAULT;1.1;AES256
  ...
wordpress_db_password: !vault |
  $ANSIBLE_VAULT;1.1;AES256
  ...
```
