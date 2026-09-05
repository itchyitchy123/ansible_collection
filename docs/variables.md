# Variables

Role defaults are safe starting points and are the source of truth. Important inputs include:

- `managed_users`: list of users with `name`, optional `groups`, `shell`, and `ssh_key`.
- `ssh_port`, `ssh_permit_root_login`, `ssh_password_authentication`, and
  `ssh_hardening_confirmed`. Set the acknowledgement only after confirming
  non-root key-based access.
- `firewall_allowed_tcp_ports`; SSH is included by default.
- `wordpress_db_password`, `wordpress_db_host`, `wordpress_version`,
  `wordpress_url`, and `wordpress_checksum`: the WordPress role requires a
  pinned archive and SHA-256 checksum; store the password in Ansible Vault.
- `backup_sources`, `backup_destination`, `backup_schedule`.
- `prometheus_package_name` and `grafana_package_name` allow distribution-specific package overrides.
  Set the matching `*_repository_configured=true` acknowledgement only after
  configuring an approved repository.

Safety acknowledgements:

- `configure_dns.yml` changes `/etc/resolv.conf` only when
  `dns_manage_resolv_conf=true`; it creates a backup before replacement.
- `update_packages.yml` requires `package_update_confirmed=true`, intended to
  be supplied after a maintenance window is selected.

Example vaulted variables:

```yaml
wordpress_db_password: !vault |
  $ANSIBLE_VAULT;1.1;AES256
  ...
```
