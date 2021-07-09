#!/bin/bash
filename=`date +%d%m%Y_%H:%M.sql`
echo $filename
mysql_ex=`systemctl status mysql | grep dead`
if [[ -z $mysql_ex ]]; then
mysqldump -u moodletest -p20020608 moodlet >$filename
else
echo "Mysql not running"
fi
