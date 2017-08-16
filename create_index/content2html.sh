#!/bin/bash
[ $# != 1 ] && echo "Need content.json." && exit
[ ! -f $1 ] && echo "File not exist" && exit

co=$(cat $1)
addr=$(echo "$co"|grep '"address":'|awk -F \" '{print $4}')
[ -z "$(echo -n $addr|grep ^1)" ] && exit
titl=$(echo "$co"|grep '"title":'|awk -F \"title\": '{print $2}'|sed 's/"//g')
title=$(printf "$titl")
[ -z "$title" ] && title="--title--"

desc=$(echo "$co"|grep '"description":'|awk -F \"description\": '{print $2}'|sed 's/"//g')
descr=$(printf "$desc")
[ -z "$descr" ] && descr="-description-"
modi=$(echo "$co"|grep '"modified":'|awk -F \"modified\": '{print $2}'|sed 's/,//g')
[ -z "$modi" ] && date="--none--"||date=$(date -d @"${modi}")

#opti=$(echo "$co"|grep '"optional":'|awk -F \"optional\": '{print $2}'|sed 's/"//g')
#[ -z "$opti" ] && opti="--none--"
size=$(echo "$co"|grep -A 99999 files_optional|grep '"size":'|awk '{sum += $2};END {print sum}')
[ -n "$size" ] && optsize=$(echo "scale=2;$size/1024000"|bc) || optsize='---'

echo  ${addr}\"${title}\"${descr}\"${date}\"${optsize}MB
