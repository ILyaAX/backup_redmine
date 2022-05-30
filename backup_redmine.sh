#!/bin/bash

s3cmd sync --delete-removed /var/local/redmine/files/ s3://demlabs/redmine/files/

pg_dump -U postgres redmine > /root/backup_redmine/$(date +%d-%m-%Y)_redmine_dump.sql

find /root/backup_redmine/ -mtime +5 -exec rm -f {} \;

s3cmd sync --delete-removed /root/backup_redmine/ s3://demlabs/redmine/db_dump/
