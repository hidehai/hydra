#!/bin/bash
cd `dirname $0`
source ./env.sh

MAINCLASSNAMES= \
"\
com.jd.bdp.hydra.benchmark.exp2.StartServiceA \
com.jd.bdp.hydra.benchmark.exp2.StartServiceB \
com.jd.bdp.hydra.benchmark.exp2.StartServiceC1 \
com.jd.bdp.hydra.benchmark.exp2.StartServiceC2 \
com.jd.bdp.hydra.benchmark.exp2.StartServiceD1 \
com.jd.bdp.hydra.benchmark.exp2.StartServiceD2 \
com.jd.bdp.hydra.benchmark.exp2.StartServiceE \
"
JPS_PATTER="StartService"
PID_FILE="$PID_DIR/.run.pid"

#function lists
PIDS=`ps -f | grep java | grep "$BASE_DIR" | awk '{print $2}'`
JAVA_PIDS=`jps | grep $JPS_PATER | awk '{print $1}'`

function running(){
	if [ -f "$PID_FILE" ]; then
		pid=$(cat "$PID_FILE")
		process=`ps aux | grep " $pid " | grep -v grep`;
		if [ "$process" == "" ]; then
	    	return 1;
		else
			return 0;
		fi
	else
		return 1
	fi
}

function start_server() {
	echo "暂不支持全部启动"
	exit 1
}

function stop_server() {
    	  index=1
    while running;
    	do
        pid=$(echo JAVA_PIDS | awk '{print $"$index"}')
        kill -9 $pid
        let index=$index+1
	     sleep 3;
    	done
	echo "Stop service successfully."
}

function help() {
    echo "Usage: startup.sh {start|stop}" >&2
    echo "       start:             start the server"
    echo "       stop:              stop the server"
}

command=$1
shift 1
case $command in
    start)
        start_server $@;
        ;;
    stop)
        stop_server $@;
        ;;
    *)
        help;
        exit 1;
        ;;
esac
