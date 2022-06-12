docker exec telegraf apt-get update
docker exec telegraf apt-get install ipmitool -y
docker restart telegraf
