#!/bin/bash
[ -z $1 ] && echo "Need PATH to data/" && exit
path='../../ZeroNet/data/'
#path to data/

echo 'URL"Title"Description"Date"Optional file size' > content.csv
find "$path" -maxdepth 2 -name content.json -exec ./content2html.sh {} \; >> content.csv
sed -i 's///g' content.csv
csvtotable -c "Update at $(date +%Y%m%d)" -d \" content.csv -o content.html
#csvtotable can be find at github: https://github.com/vividvilla/csvtotable
