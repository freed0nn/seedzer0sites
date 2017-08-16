#!/bin/bash
[ $# != 1 ] && echo "Need PATH/TO/data" && exit
[ ! -d $1 ] && echo "Wrong path" && exit

bash get_all_zeroURL.sh $1
comm -23 bit_pureURL.lst Done.lst > TODO.lst
comm -23 common_pureURL.lst Done.lst >> TODO.lst
bash runseed.sh TODO.lst
