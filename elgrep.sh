#!/bin/zsh

echo "***** CONFIGS /etc ******"
sudo grep -rnw /etc -e ".*$1.*"

echo "***** CONFIGS /usr/local/etc ****"
sudo grep -rnw /usr/local/etc -e ".*$1.*"

echo "***** EXEC FILES /usr/local ********"
find /usr/local -type f -perm +111 -iname "*$1*" -not -path "*/node_modules/*" -not -path "*/site-packages/*"

echo "***** DIRS /usr/local ********"
find /usr/local -type d -iname "*$1*" -not -path "*/node_modules/*" -not -path "*/site-packages/*"

echo "**** HOME less 100k files"
find ~/ -type f -maxdepth 1 -size -100k -exec grep -H ".*$1.*" {} \;
