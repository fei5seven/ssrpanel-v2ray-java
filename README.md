# ssrpanel-v2ray-java

安装JDK

```
# ubuntu
sudo apt-get install default-jdk
# centos
yum install java-1.8.0-openjdk java-1.8.0-openjdk-devel
```

下载文件部署文件
```
git clone https://github.com/fei5seven/ssrpanel-v2ray-java.git /v2ray
cd /v2ray
```
修改 config.properties 文件
```
几个重点配置项
- v2ray.system (操作系统，可选值：linux、windows)
- v2ray.arch (操作系统位数，可选值：32、64)
- v2ray.tag (VMess协议的tag)
- v2ray.alter-id (与面板里设定的额外ID一致)
- v2ray.level (用户等级，暂无用)
- node.id (面板添加节点后得到的节点ID)
- node.traffic-rate (与面板里设定的流量比例一致)

数据库配置(远程连接SSRPanel的数据库)
- datasource.url (数据库的连接URL, 格式为 jdbc:mysql://地址:端口/数据库名称?serverTimezone=GMT%2B8)
- datasource.username (用户名)
- datasource.password (密码)
```
执行一次部署
```
java -jar ssrpanel-v2ray.jar
```

修改配置文件

添加开机启动
```
vim /etc/rc.local
bash /v2ray/v2start.sh
```


安装caddy对接，选择3，端口9999(也可作为旧版v2ray一键懒人安装方式）
```
bash <(wget --no-check-certificate -qO- https://raw.githubusercontent.com/fei5seven/ssrpanel-v2ray-java/master/deploy_node.sh)
```


## [安装锐速](https://github.com/fei5seven/lotServer)
