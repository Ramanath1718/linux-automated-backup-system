echo $(date) " - Backup Started " >> ~/linux-automated-backup-system/logs/backup.log
tar -czvf ~/linux-backups/"backup_$(date +%F).tar.gz" ~/linux-automated-backup-system/data
if [ $? -eq 0 ]; then
	echo $(date) " - Backup is successful" >> ~/linux-automated-backup-system/logs/backup.log
	find ~/linux-backups -type f -name "*.tar.gz" -mtime +7 -delete
else
	echo $(date) " - Error while taking backup" >> ~/linux-automated-backup-system/logs/backup.log
fi
