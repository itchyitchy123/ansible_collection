# Reference deployments

These examples are deliberately small starting points. Replace inventory names,
repository settings, and vaulted values for the target environment.

## Hardened web host

1. Create a non-root administrator with a public key using `create_users.yml`.
2. Verify key-based login in a second terminal session.
3. Run `harden_linux.yml` with `-e ssh_hardening_confirmed=true`.
4. Allow required TCP ports with `configure_firewall.yml` before deploying a
   service.

The acknowledgement is intentional: never make SSH access changes from the
only active administrative connection.

## WordPress stack

Place secrets and immutable artifact metadata in an encrypted variables file:

```yaml
wordpress_db_password: !vault |
  $ANSIBLE_VAULT;1.1;AES256
  ...
wordpress_version: "<approved-version>"
wordpress_url: "https://example.internal/artifacts/wordpress-<approved-version>.tar.gz"
wordpress_checksum: "<sha256-of-approved-archive>"
```

Run `deploy_wordpress.yml` with the vaulted file. The collection intentionally
does not select a mutable upstream `latest` archive for you.
