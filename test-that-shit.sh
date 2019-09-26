docker run -v "$(pwd)/creds:/creds" -v "$(pwd)/tmp:/restore"  -e GCS_BUCKET_REDIS=gs://rplan-redis-backups -e BACKUP_FULL_NAME=redis_backup_rplan_staging-2019-08-12T160023Z.rdb.tar.gz -e GOOGLE_APPLICATION_CREDENTIALS=/creds/creds.json rest

