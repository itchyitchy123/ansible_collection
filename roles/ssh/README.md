# SSH role

Installs and enables OpenSSH, then writes a validated hardening fragment. When
root and password access are disabled, set `ssh_hardening_confirmed=true` only
after verifying non-root key-based administrator access.
