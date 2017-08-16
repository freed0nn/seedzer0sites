#!/bin/bash
if [ $# != 1 ];then
  echo "Usage: $0 URL"
  echo "Need URL like:"
  echo "  127.0.0.1:43110/13febzmumvtbnGh1o8wBeFS6XtFjP5hM1S"
  echo "  http://192.168.15.158:43110/0web.bit"
  exit 1
fi
if [ -z "$(echo $1|grep -o '[0-9][0-9]*:[0-9]*/[a-zA-Z0-9][a-zA-Z0-9.-]*')" ];then
  echo "Wrong url"
  exit 1
fi

url="$1"
curl --retry 2 --connect-timeout 6 -m 10 -LsI -H "Accept: text/html" "$url" > _TMP
if [ -n "$(grep -a '^HTTP/1.1 200 OK' _TMP)" ];then
  echo "$url : visited"
  exit 0
elif [ -n "$(grep -a '^HTTP/1.1 403 Forbidden' _TMP)" ];then
  echo "$url : 403 Forbidden happened."|tee -a Fail.log
  exit 403
elif [ -n "$(grep -a '^HTTP/1.1 404 Not Found' _TMP)" ];then
  echo "$url : 404 Not Found."|tee -a Fail.log
  exit 404
else echo "$url : unknown fail"
fi
