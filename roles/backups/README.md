# Backups role

Installs the platform cron package and a root-owned local tar backup job.
Configure `backup_sources`, `backup_destination`, `backup_schedule`, and
`backup_retention_days`. This is local retention only; copy archives to remote
storage separately and test restoration.
