# ssrpanel-v2ray-java

安装JDK

```
# ubuntu
sudo apt install openjdk-8-jdk
# centos
yum install java-1.8.0-openjdk java-1.8.0-openjdk-devel
```

修改配置文件

添加开机启动
```
vim /etc/rc.local
bash /root/ssrpanel-v2ray-java/v2start.sh
