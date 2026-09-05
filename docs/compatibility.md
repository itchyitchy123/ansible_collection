# Compatibility matrix

The tested CI baseline is Ubuntu 22.04 and AlmaLinux 9. Both are container
tests, so they do not replace validation against the kernel, package mirrors,
and identity provider used in a production environment.

| Capability | Ubuntu 22.04 | AlmaLinux 9 | Prerequisite |
|---|---|---|---|
| `users`, `backups`, `hardening`, `ssh` | Tested in Molecule | Tested in Molecule | Privileged container for hardening |
| Apache, MariaDB, PHP, Redis, Fail2Ban, Chrony | Distribution repositories | Distribution repositories | None beyond enabled OS repositories |
| Docker | Distribution package availability varies | Distribution package availability varies | Configure Docker's vendor repository when current Docker CE is required |
| Prometheus, node exporter | Distribution repository | EPEL commonly required | Configure the required monitoring repository first |
| Grafana | Grafana vendor repository | Grafana vendor repository | Configure Grafana's vendor repository first |
| WordPress | Tested by syntax only | Tested by syntax only | Apache, MariaDB, PHP, and a pinned archive checksum |

Roles use the generic `package` module where package names are stable. A role
does not silently add third-party repositories: repository governance, proxy
settings, and package signing policy remain under the consuming environment's
control. Override package variables only after confirming availability in the
approved repository.

## Operational guardrails

- SSH lockout settings require `ssh_hardening_confirmed=true`.
- Replacing `/etc/resolv.conf` requires `dns_manage_resolv_conf=true`; the old
  file is backed up by Ansible.
- Full package upgrades require `package_update_confirmed=true`.
- WordPress requires a versioned archive URL and SHA-256 checksum. Do not use
  an unpinned `latest` URL in automation.
