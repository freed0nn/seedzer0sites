#!/bin/bash
[ ! -f "$1" ] && echo 'Need file that contains pure URL' && exit

perfix="127.0.0.1:43110/"

for i in $(cat "$1");do

  bash seed.sh ${perfix}${i}
  [ $? = 0 ] && echo $i >> Done.tmp
done

sort -u Done.tmp > Done.lst
cp Done.lst Done.tmp
