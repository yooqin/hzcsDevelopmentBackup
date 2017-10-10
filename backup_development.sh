#!/bin/bash

backdir="/home/yooqin/www/mayflowes /home/yooqin/www/oa /home/yooqin/www/sports_lottery"
password=$1
day=`date "+%Y%m%d%H%M%S"`
filename="development-www-$day.tar.gz"
sqlfilename="/home/yooqin/hzcsDevelopmentBackup/development-mysql-$day.tar.gz"
sqldir="/home/yooqin/sqlback"

if [ ! -n "$password" ] ;then
    echo "use eg: backup_development.sh password "
    exit;
fi

echo ">>>>> Script will run"

#BackMysql

cd /home/yooqin/hzcsDevelopmentBackup
echo "-------Backup Mysql"
rm $sqldir/*.dump

mysqldump -uroot -p'e(YY33b..' sportslottery > $sqldir/sportslottery.dump
mysqldump -uroot -p'e(YY33b..' oa > $sqldir/oa.dump
mysqldump -uroot -p'e(YY33b..' mayflowes > $sqldir/mayflowes.dump

tar -czf $sqlfilename $sqldir
openssl aes-128-cbc -salt -k $password -in $sqlfilename -out "$sqlfilename.aes"
rm $sqlfilename
#end BackMysql

echo "-----Backup PHP"
tar -czf $filename $backdir
openssl aes-128-cbc -salt -k $password -in $filename -out "$filename.aes"
rm $filename

git add -A
git commit -am "add backup $day"
git push origin master


#openssl aes-128-cbc -d -salt -in development-www-20170929140740.tar.gz.aes -out out.tar.gz
