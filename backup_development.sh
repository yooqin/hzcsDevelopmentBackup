#!/bin/bash

backdir="~/www"

echo "> begin backup"

echo "- backup www dir";

day=`date "+%Y%m%d%H%M%S"`

filename="development-www-$day"

echo $filename

tar -czvf $filename $backdir

