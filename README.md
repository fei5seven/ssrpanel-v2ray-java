# ssrpanel-v2ray-java

安装JDK

```
# ubuntu
sudo apt install openjdk-8-jdk
# centos
yum install java-1.8.0-openjdk java-1.8.0-openjdk-devel
```

下载文件部署文件
```
git clone https://github.com/fei5seven/ssrpanel-v2ray-java.git
cd ssrpanel-v2ray-java
```
执行一次部署
```
java -jar ssrpanel-v2ray.jar
```

修改配置文件

添加开机启动
```
vim /etc/rc.local
bash /root/ssrpanel-v2ray-java/v2start.sh
```


安装caddy对接，端口9999
```
bash <(wget --no-check-certificate -qO- https://raw.githubusercontent.com/fei5seven/Shell-1/master/deploy_node.sh)
```


## [安装锐速](https://github.com/fei5seven/lotServer)
