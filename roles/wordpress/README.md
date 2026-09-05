# WordPress role

Deploys a versioned WordPress archive. `wordpress_version`, `wordpress_url`,
and a SHA-256 `wordpress_checksum` are required, as are a vaulted
`wordpress_db_password` and valid database connection values. The role assigns
the files to `wordpress_owner` and `wordpress_group` so the web service can
read its configuration.
