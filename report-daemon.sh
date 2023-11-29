#!/bin/bash

export REPORT_SERVER_URL="http://<SERVERHOST>/api/reportme"
export REPORT_SERVER_TOKEN="<TOKEN>"
export SERVER_FRONTEND_URL="http://your.domain"
export SERVER_MYSQL_USER="bps"
export SERVER_MYSQL_DATABASE="bps_db"
export SERVER_STATUS_NOTE="dev-server"

echo "Reporting to URL: $REPORT_SERVER_URL"

curl -H "Content-type: multipart/form-data" \
     -F server_access_token="$(echo $REPORT_SERVER_TOKEN)" \
     -F server_hostname="$(hostname)" \
     -F server_frontend_url="$(echo $SERVER_FRONTEND_URL)" \
     -F server_ipv4="$()" \
     -F server_ipv6="$(curl ifconfig.me)" \
     -F server_os="$(cat /etc/*-release | egrep "PRETTY_NAME|VERSION_ID" | cut -d = -f 2 | tr -d '"' | tac | tr '\n' ' ')" \
     -F server_mysql_version="$(mysql -V)" \
     -F server_mysql_user="$(echo $SERVER_MYSQL_USER)" \
     -F server_mysql_database="$(echo $SERVER_MYSQL_DATABASE)" \
     -F server_php_version="$(php -v)" \
     -F server_cpu_usage_perc="$(grep 'cpu ' /proc/stat | awk '{usage=($2+$4)*100/($2+$4+$5)} END {print usage "%"}')" \
     -F server_ram_usage_perc="$(free | grep Mem | awk '{print $3/$2 * 100.0}')" \
     -F server_storage_usage_perc="$(df --output=pcent / | grep -v Use)" \
     -F server_cpu_cores="$(nproc --all)" \
     -F server_ram_quota_mb="$(cat /proc/meminfo | grep MemTotal | awk '{print ($2/1000)}')" \
     -F server_storage_quota_mb="$(df --output=size -h -BM / | grep -v 1M-blocks)" \
     -F server_status_code="$()" \
     -F server_status_note="$(echo $SERVER_STATUS_NOTE)" \
     -F server_daemon_version="V 0.1" \
     -F server_last_deamon_update="$()" \
     -F server_last_deamon_update_check="$()" \
     -F server_last_backup="$()" \
     -F server_backup_url="$()" \
     -F server_backup_htaccess_user="$()" \
     -F server_backup_htaccess_password="$()" \
     -F server_uptime="$(uptime)" \
     -X POST \
     $(echo $REPORT_SERVER_URL)