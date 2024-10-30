Export following to use script:

```shell

echo 'export REPORT_SERVER_URL="http://<SERVERHOST>/api/reportme"' >> ~/.bashrc
echo 'export REPORT_SERVER_TOKEN="<TOKEN>"' >> ~/.bashrc

echo 'export SERVER_FRONTEND_URL="http://your.domain"' >> ~/.bashrc
echo 'export SERVER_MYSQL_USER="bps"' >> ~/.bashrc
echo 'export SERVER_MYSQL_DATABASE="bps_db"' >> ~/.bashrc
echo 'export SERVER_STATUS_NOTE="dev-server"' >> ~/.bashrc
source ~/.bashrc


```

Then add following to the cronjob after making the script executable!
```shell

sudo nano /etc/crontab

*/1 * * * * root /<YOUR PATH>/report-daemon/report-daemon.sh > /var/log/report-daemon.log 2>&1

service cron reload
```

and then reload cron!


# Backup Setup 

https://code.fbi.h-da.de/stjaguens/fastda-server-setup

You need to set the backup parameters e.g. with curl like this:

```shell
curl -H "Content-type: multipart/form-data" -F server_access_token="[TOKEN HERE]" -F server_backup_url="[URL]" -F server_backup_htaccess_user="[USERNAME]" -F server_backup_htaccess_password="[PASSWORD]" -X POST https://backup.fastda.users.h-da.cloud/api/setupbackup.php
```