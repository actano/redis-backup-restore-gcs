GCS_BUCKET_REDIS=gs://allex-events-redis-staging-backups \
BACKUP_FULL_NAME=redis_backup_rplan_staging-2019-09-27T010012Z \
NAMESPACE=staging \
POD_NAME=events-redis-staging-redis-ha-server-0 \
./restore.sh
