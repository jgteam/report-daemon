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