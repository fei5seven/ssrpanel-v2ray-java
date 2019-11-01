# ssrpanel-v2ray-java
 ~~基本完事了，不会再更新了~~
 - 此为ssrpanel面板对应的V2ray后端。整理自[MoeGrid](https://github.com/MoeGrid/ssrpanel-v2ray)大佬+个人修改部分内容
 - 不建议内存低于512M超小鸡使用，java本身占用内存很高。
 - 每天0点自动检查v2ray更新，因此基本不用管它。

***
  * [安装JDK](#安装JDK)
  * [安装和调试](#安装和调试)
  * [脚本使用方法](#脚本使用方法)
  * [修改时区](#修改时区)
  * [安装caddy对接](#安装caddy对接)
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
 - 下载部署文件
```
git clone https://github.com/fei5seven/ssrpanel-v2ray-java.git /v2ray
chmod -R a+x /v2ray
cd /v2ray
```

 - 修改 config.properties 文件
 几个重点配置项
```
- v2ray.system (操作系统，可选值：linux、windows)
- v2ray.arch (操作系统位数，可选值：32、64)
- node.traffic-rate (与面板里设定的流量比例一致)
- v2ray.tag (VMess协议的tag)
- v2ray.alter-id (与面板里设定的额外ID一致)
- v2ray.level (用户等级，暂无用)
```
~~用默认参数就好，现在也没小鸡还32位了吧=，=~~
 - 数据库配置(远程连接SSRPanel的数据库，必须严格填写)
```
- node.id (面板添加节点后得到的节点ID)
- datasource.url (数据库的连接URL, 格式为 jdbc:mysql://地址:端口/数据库名称?serverTimezone=GMT%2B8)
- datasource.username (用户名)
- datasource.password (密码)
```
 - 执行一次部署
```
java -jar ssrpanel-v2ray.jar
```
 - 添加开机启动
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
````
dpkg-reconfigure tzdata

````
***
#### 安装caddy对接
选择3，端口默认10086(也可作为旧版v2ray 4.9.0一键懒人安装方式）
```
bash <(wget --no-check-certificate -qO- https://git.io/deploy_node.sh)
```
***
#### [安装锐速](https://github.com/fei5seven/lotServer)
