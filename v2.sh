#!/bin/bash
# 
#chkconfig: 5 80 90  
#description:check  
#  
  
# source function library  
#. /etc/rc.d/init.d/functions  
  
JAVA_HOME=/usr/bin  
export JAVA_HOME=$JAVA_HOME  
export PATH=$PATH:$JAVA_HOME/bin:$JAVA_HOME/jre/bin  

DIALUP_PID=/v2ray/dialup.pid 
start()  
{  
    echo -n $"Starting $prog: "  
    echo "v2ray-java启动中"  
	cd /v2ray
	nohup java -jar ssrpanel-v2ray.jar  > log.file  2>&1 & new_agent_pid=$! 
	echo "$new_agent_pid" > $DIALUP_PID 
	sleep 1
    echo "启动成功" 
}  
   
stop()  
{  
         
     if [ -f /v2ray/dialup.pid ];then  
                    SPID=`cat /v2ray/dialup.pid`  
                      if [ "$SPID" != "" ];then  
                         kill -9  $SPID  
                         echo  > $DIALUP_PID  
						 ps -ef | grep v2ray | grep -v grep | awk '{print $2}' | xargs kill -9
						  sleep 1
                          echo "停止成功" 
                      fi  

     fi  
}  
  
CheckProcessStata()  
{  
    CPS_PID=$1  
    if [ "$CPS_PID" != "" ] ;then  
        CPS_PIDLIST=`ps -ef|grep $CPS_PID|grep -v grep|awk -F" " '{print $2}'`  
    else  
        CPS_PIDLIST=`ps -ef|grep "$CPS_PNAME"|grep -v grep|awk -F" " '{print $2}'`  
    fi  
  
    for CPS_i in `echo $CPS_PIDLIST`  
    do  
        if [ "$CPS_PID" = "" ] ;then  
            CPS_i1="$CPS_PID"  
        else  
            CPS_i1="$CPS_i"  
        fi  
  
        if [ "$CPS_i1" = "$CPS_PID" ] ;then  
            #kill -s 0 $CPS_i  
            kill -0 $CPS_i >/dev/null 2>&1  
            if [ $? != 0 ] ;then  
                echo "[`date`] MC-10500: Process $i have Dead"   
                kill -9 $CPS_i >/dev/null 2>&1  
                 
                return 1  
            else  
                #echo "[`date`] MC-10501: Process is alive"   
                return 0  
            fi  
        fi  
    done  
    echo "[`date`] MC-10502: Process $CPS_i is not exists"   
    return 1  
}  
  
status()  
{  
  SPID=`cat /v2ray/dialup.pid`   
  CheckProcessStata $SPID >/dev/null  
                             if [ $? != 0 ];then  
                                echo "v2ray-java:{$SPID}  尚未运行"  
                              else  
                                echo "v2ray-java:{$SPID} 运行中"  
                             fi  
  
}  
   
restart()  
{  
    echo "停止中"  
    stop  
    echo "启动中"  
    start  
}  
   
case "$1" in  
    start)  
        start  
        ;;  
    stop)  
        stop  
        ;;  
    status)  
         status  
        ;;  
    restart)  
        restart  
        ;;  
    *)  
        echo $"Usage: $0 {start|stop|restart}"  
        RETVAL=1  
esac  
exit $RETVAL  
