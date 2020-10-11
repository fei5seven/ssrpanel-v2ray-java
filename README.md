# ssrpanel-v2ray-java
 ~~基本完事了，不会再更新了。~~  
  好吧，我又更新了。把文件从上往下翻了个遍改了一下更新地址到@v2fly 的库了。
 > ~~本意是方便自己复制粘贴新建小鸡的项目，让胖虎大佬反向star受宠若惊，连滚带爬的修改了一下readme以示敬意。~~  
 > 此为ssrpanel面板（4.8.0）对应的V2ray后端。整理自[MoeGrid](https://github.com/MoeGrid/ssrpanel-v2ray)大佬和[ColetteContreras]( https://github.com/ColetteContreras/v2ray-ssrpanel-plugin)大佬+个人修改部分内容
 > 不建议内存低于512M超小鸡使用，java本身占用内存很高。
 > 默认模式为ws+tls，每天0点自动检查v2ray更新，因此基本不用管它。
 > 虽然被胖虎大佬说java后台简陋，但是他真的很少出问题并且能随时更新后端啊.jpg

***
  * [安装JDK](#安装JDK)
  * [安装和调试](#安装和调试)
  * [脚本使用方法](#脚本使用方法)
  * [修改时区](#修改时区)
  * [安装caddy对接](#安装caddy对接)
  * [配置宝塔面板对接](#配置宝塔面板对接)
  * [安装锐速](#安装锐速)
***
#### 安装JDK
```
# ubuntu
sudo apt-get install default-jdk
# centos
yum install java-1.8.0-openjdk java-1.8.0-openjdk-devel
```
***
#### 安装和调试
 > 下载部署文件
```
git clone https://github.com/fei5seven/ssrpanel-v2ray-java.git /v2ray
chmod -R a+x /v2ray
cd /v2ray
```

 > 修改 config.properties 文件  
 几个重点配置项说明
```
- v2ray.system (操作系统，可选值：linux、windows)
- v2ray.arch (操作系统位数，可选值：32、64)
- node.traffic-rate (与面板里设定的流量比例一致)
- v2ray.tag (VMess协议的tag)
- v2ray.alter-id (与面板里设定的额外ID一致)
- v2ray.level (用户等级，暂无用)
```
~~上面用默认参数就好，现在也没小鸡还32位了吧=，=~~
 > 数据库配置(远程连接SSRPanel的数据库，必须严格填写)
```
- node.id (面板添加节点后得到的节点ID)
- datasource.url (数据库的连接URL, 格式为 jdbc:mysql://地址:端口/数据库名称?serverTimezone=GMT%2B8)
- datasource.username (用户名)
- datasource.password (密码)
```
 > 执行一次部署
```
java -jar ssrpanel-v2ray.jar
```
 > 添加开机启动
```
vim /etc/rc.local
bash /v2ray/v2.sh start
```
如果能正确获取用户数就基本没问题了。报错的话基本就是数据库配置这里的填写错误了。
***
#### 脚本使用方法 
控制v2ray和java控制器的启动停止等。
````
bash /v2ray/v2.sh  {start|stop|status|restart}
````
***
 #### 修改时区
 为的是对接面板的流量统计
````
cp /usr/share/zoneinfo/Asia/Shanghai  /etc/localtime
````
或者  
（推荐）
````
dpkg-reconfigure tzdata

````
***
#### 安装caddy对接
选择3，端口默认10086(也可作为大佬的v2ray GO版一键懒人安装方式）
```
bash <(wget --no-check-certificate -qO- https://git.io/deploy_node.sh)
```
***
#### 配置宝塔面板对接
最后一个｝前加入如下代码
```
        location /ray {
        proxy_redirect off;
        proxy_pass http://127.0.0.1:10000;#假设WebSocket监听在环回地址的10000端口上
        proxy_http_version 1.1;
        proxy_set_header Upgrade $http_upgrade;
        proxy_set_header Connection "upgrade";
        proxy_set_header Host $http_host;
        }
 ```
#### [安装锐速](https://github.com/fei5seven/lotServer)
