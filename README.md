# redis-backup-gcs

Create a backup of a specified redis db to Google Cloud Storage

## Configuration

Set the following environment variables for the Docker container:

`GCS_BUCKET_REDIS` Google Cloud Storage bucket name

`BACKUP_FULL_NAME` Full name of the backup that should be restored

`POD_NAME` The name of the redis pod you want the backup to restore to

`NAMESPACE` The namespace where the pod resides `staging` or `producton` etc
