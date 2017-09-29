#!/bin/bash

backdir="/home/yooqin/www/testa"

echo "> begin backup"

echo "- backup www dir";

password=$1
day=`date "+%Y%m%d%H%M%S"`

filename="development-www-$day.tar.gz"

echo $filename

tar -Cczvf $filename $backdir

openssl aes-128-cbc -salt -k $password -in $filename -out "$filename.aes"

rm $filename

git add -A
git commit -am "add backup $day"
git push origin master



#openssl aes-128-cbc -d -salt -k password -in development-www-20170929140740.tar.gz.aes -out out.tar.gz
