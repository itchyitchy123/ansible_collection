# MariaDB role

Installs MariaDB and PyMySQL, enables the service, then manages
`mariadb_databases` and `mariadb_users`. Store every user password in Ansible
Vault; task output containing user definitions is suppressed.
