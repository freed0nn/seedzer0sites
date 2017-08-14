## 这几个脚本是用来主动发现ZeroNet的站点的。
[English version](./README.md)

一般而言，一个人创建了他自己的站点之后，要把站点的地址发到论坛/博客，或者像http://127.0.0.1:43110/1LtvsjbtQ2tY7SCtCZzC4KhErqEK3bXD4n 这样的站点。节点需要主动点击这些链接才会下载站点并做种，手工十分繁琐，用脚本就很快了（如果官方能开发相关API就更赞了）。

## 原理
想要获得大量的zeronet站点的地址，就需要主动发现地址

方法是：
 1. 先简单访问几个知名站点，作为起点
 2. 在硬盘中的文件中搜寻符合zeronet格式的链接
 3. curl访问这些链接
上面的2和3步骤循环几次，就可以得到大量的zeronet站点，刚开始的几步，数量应该是几何级增长的。
我重复**3次**，就得到了2300多个站点。

## 环境
Ubuntu/debian 等Linux操作系统，安装有ag 和curl
`sudi apt insatll silversearcher-ag curl`

## 使用步骤
* 启动zeronet
`python zeronet.py`

* 如果是第一次运行zeronet的话，需要简单访问几个人气多的站点
如：
  http://127.0.0.1:43110/Talk.ZeroNetwork.bit/
  http://127.0.0.1:43110/NewGFWTalk.bit/
  http://127.0.0.1:43110/mydf.bit/
  http://127.0.0.1:43110/Board.ZeroNetwork.bit/
  http://127.0.0.1:43110/0list.bit/
下面这个是我的站点
 http://127.0.0.1:43110/1G7jmLghk4h3RiBy4QLGnR4rih7zj7QkMV/
  

* 下载各个脚本，并且添加执行权限
```
chmod +x get_all_zeroURL.sh seed.sh runseed.sh
```

* 获取硬盘中的所有的zeronet链接
`./get_all_zeroURL.sh PATH/TO/data`
PATH/TO/data 为zeronet的data目录的路径，执行大概会要5-15分钟，和目录大小/硬盘读写速度有关。
结束后会得到common_pureURL.lst 和 bit_pureURL.lst，common_pureURL.lst里面是`1G7jmLghk4h3RiBy4QLGnR4rih7zj7QkMV`这样的链接；
 bit_pureURL.lst里面是`Talk.ZeroNetwork.bit`这样的链接。

* 做种/访问这些站点
 `./runseed.sh common_pureURL.lst && ./runseed.sh bit_pureURL.lst`
 访问失败的链接会记录到Fail.log中，一起记录的还有访问失败的原因，404/403/unknown
 
 ## 后面会给出添加黑名单的方法，屏蔽无用/非法的站点
