#!/bin/bash
[ -z "$1" ] && echo "Need PATH to data/" && exit
[ ! -d "$1" ] && echo "PATH no exist"  && exit

for d in $(cat SeedDirs.lst); do
 echo "dir: ${1}${d}"
# echo "Finding common URL like: 1HeLLo4uzjaLetFx6NH3PMwFP3qbRbTf3D"
# echo "Save to common_pureURL.lst"
 time ag -o '43110/1[A-Za-z0-9]{31,33}' -G json --nofilename --nobreak "${1}${d}" >> _TMP1

# echo
# echo "Finding bit URL like: Mail.ZeroNetwork.bit"
# echo "Save to bit_pureURL.lst"
# time ag -o '[A-Za-z0-9-.]+\.bit' -G json --nofilename --nobreak "${1}${d}" > _TMP2

 echo
done

sort -u _TMP1 > common_pureURL.lst
sed -i 's/43110\///g' common_pureURL.lst
#sort -u _TMP2 > bit_pureURL.lst

