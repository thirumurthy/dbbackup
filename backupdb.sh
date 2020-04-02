#! /bin/sh
cd $(dirname $0)
DB=$1
DBUSER=$2
DBPASSWD=$3
HOST=$4
FILE=$DB-$(date +%F).sql
mysqldump --routines "--user=${DBUSER}" -h $HOST  --password=$DBPASSWD $DB > $PWD/$FILE
gzip $FILE
echo Created $PWD/$FILE*
# Code Copied from https://stackoverflow.com/questions/5075198/how-to-export-mysql-database-with-triggers-and-procedures
# Example Usage : backupdb.sh my_db dev_user dev_password
# Get this code Using wget https://raw.githubusercontent.com/thirumurthy/dbbackup/master/backupdb.sh
