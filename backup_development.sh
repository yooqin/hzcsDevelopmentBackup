#!/bin/bash

backdir="/home/yooqin/www/testa"

echo "> begin backup"

echo "- backup www dir";

day=`date "+%Y%m%d%H%M%S"`

filename="development-www-$day.tar.gz"

echo $filename

tar -czvf $filename $backdir

openssl aes-128-cbc -salt -k 123 -in $filename -out "$filename.aes"

rm $filename

git add -A
git commit -am "add backup $day"
git push origin master
