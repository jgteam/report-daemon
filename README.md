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