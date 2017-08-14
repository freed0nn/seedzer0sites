#!/bin/bash
[ -z "$1" ] && echo "Need PATH to data/" && exit
[ ! -d $1 ] && echo "PATH no exist"  && exit

echo "Finding common URL like: 1HeLLo4uzjaLetFx6NH3PMwFP3qbRbTf3D"
echo "Save to common_pureURL.lst"
time ag -o '43110/1[A-Za-z0-9]{31,33}' -G json --nofilename --nobreak "$1"|sort -u > common_pureURL.lst
sed -i 's/43110\///g' common_pureURL.lst

echo
echo "Finding bit URL like: Mail.ZeroNetwork.bit"
echo "Save to bit_pureURL.lst"
time ag -o '[A-Za-z0-9-.]+\.bit' -G json --nofilename --nobreak "$1"|sort -u > bit_pureURL.lst

