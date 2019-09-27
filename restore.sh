#!/bin/bash
set -e pipefail

if [ -z $GCS_BUCKET_REDIS ]; then
    echo "You must specify a google cloud storage GCS_BUCKET_REDIS address such as gs://my-backups/"
    exit 1
fi

if [ -z $BACKUP_FULL_NAME ]; then
    echo "You must specify the full name of the redis backup"
    exit 1
fi

echo "Activating google credentials before beginning"
gcloud auth activate-service-account --key-file "$GOOGLE_APPLICATION_CREDENTIALS"

if [ $? -ne 0 ] ; then
    echo "Credentials failed; no way to copy to google."
    echo "Ensure GOOGLE_APPLICATION_CREDENTIALS is appropriately set."
fi

echo "=============== Redis Backup RESTORE ======================="
echo "Beginning restore from $GCS_BUCKET_REDIS/$BACKUP_FULL_NAME.rdb.tar.gz to the volume mapped to /restore"
echo "============================================================"

echo "Fetch dump from google"
gsutil cp "$GCS_BUCKET_REDIS/$BACKUP_FULL_NAME.rdb.tar.gz" "/restore/dump.tar.gz"
echo "Unpacking tar file"
cd /restore
tar -xzf ./dump.tar.gz
cp ./backup/${BACKUP_FULL_NAME}.rdb ./dump.rdb

echo "Remove the old dump file if it exists"
mkdir -p /volume/data
rm -rf /volume/data/dump.rdb

echo "Copy new dump to volume"
cp /restore/dump.rdb /volume/data/dump.rdb

echo "Redis backup restored"
exit $?
