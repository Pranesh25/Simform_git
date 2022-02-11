#! /bin/bash

MONGO_DATABASE="test"
BACKUPS_DIR="/tmp/$MONGO_DATABASE"

TIMESTAMP=`date +%y-%m-%d`
BACKUP_NAME="$MONGO_DATABASE-$TIMESTAMP"

sudo mongodump -d $MONGO_DATABASE --out $BACKUPS_DIR/$BACKUP_NAME
sudo rm -rf /var/backups/$BACKUP_NAME
sudo mv $BACKUPS_DIR  /var/backups/$BACKUP_NAME
echo "--------------------------------------------"
echo "Database backup complete!"