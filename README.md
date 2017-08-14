# seedzer0site
[中文手册](./README_zh.md)

Scripts is used to help people to be a zeronet seeder/node **actively**.
Usually, one will post his zeronet site url to some forums or his friend's blog, or sites like http://127.0.0.1:43110/1LtvsjbtQ2tY7SCtCZzC4KhErqEK3bXD4n , so that others can click his url and help him distribute his site, so this url will exist in your computer disk if you have visited thoses forums or blogs.

you don't need to find and click thoses url manually, just use scripts.

## Fix
It is obviously that `curl --silent http://$ZERO_HOST:43110/$SITE > /dev/null` provided by http://127.0.0.1:43110/1LtvsjbtQ2tY7SCtCZzC4KhErqEK3bXD4n does NOT work actually, then i repaired it. Use this one `curl --silent http://$ZERO_HOST:43110/$SITE -H "Accept: text/html" > /dev/null`

## Rely on
ubuntu/debian or other linux
`sudo apt install silversearcher-ag curl`

## Steps
* Run zeronet programm
`python zeronet.py`

* Visit some zerosites if it is your first time to run zeronet
http://127.0.0.1:43110/Talk.ZeroNetwork.bit/
http://127.0.0.1:43110/NewGFWTalk.bit/
http://127.0.0.1:43110/mydf.bit/
http://127.0.0.1:43110/Board.ZeroNetwork.bit/
http://127.0.0.1:43110/0list.bit/
next is mine.
http://127.0.0.1:43110/1G7jmLghk4h3RiBy4QLGnR4rih7zj7QkMV/

* Run get_all_zeroURL.sh
```
chmod +x get_all_zeroURL.sh
./get_all_zeroURL.sh PATH/TO/data
```
this step may costs 5 to 15 minutes， then you will get common_pureURL.lst and bit_pureURL.lst

* Run runseed.sh
```
chmod +x runseed.sh
./runseed.sh common_pureURL.lst && ./runseed.sh bit_pureURL.lst
```
this step will costs 5-15 minutes also. 

**repeat** steps above about 4 times, you will get nearly all zerosites.
It maybe stupid, but usefull.
