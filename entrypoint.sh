#!/bin/sh
day=$(/bin/date +%Y-%m-%d-%H-%M);
mkdir $DATA_FOLDER/backup;
sqlite3 $DATA_FOLDER/db.sqlite3 ".backup '$DATA_FOLDER/backup/db.sqlite3-$day'"
zip -m -P $PASSWD $DATA_FOLDER/backup/db.sqlite3-$day.zip $DATA_FOLDER/backup/db.sqlite3-$day
find $DATA_FOLDER/backup/* -type f -mtime +7 -exec rm -rf {} \;
rclone sync $DATA_FOLDER/backup $REMOTE:/bitwarden_backup -v -P
