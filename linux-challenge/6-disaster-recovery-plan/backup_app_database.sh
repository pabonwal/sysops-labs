#!/bin/bash

exec > /root/backup_app_database.log 2>&1

filedate=$(date "+%F-%H%M%S")

echo "### START $(date "+%F-%H%M%S")"

# backup of nginx config files
tar -czf /mnt/backups/backup_nginx_conf_$filedate.tar.gz /etc/nginx/

# backup of webapp files
tar -czf /mnt/backups/backup_app_files_$filedate.tar.gz /var/www/html/

# backup of mysql database
mysqldump --no-tablespaces -u wpuser -pPassword -h server2 wordpress > /mnt/backups/backup_app_database_$filedate.sql

echo "### END $(date "+%F-%H%M%S")"

mail -s "Backup finished" user1@server1 < /root/backup_app_database.log
