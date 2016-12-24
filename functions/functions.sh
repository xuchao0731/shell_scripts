#!/bin/bash
source ./alert.sh
function result() {
	if [ $? -ne 0 ]
	then 
		echo -e "${RED_COLOR} $1 ${RES}"
		exit 1
	fi
}
#判断用户是否为root
function ifRoot() {
	if [ $UID -ne 0 ]
	then 
		echo -e  "${RED_COLOR}当前用户为普通用户，需要切换到root用户执行该脚本${RES}"
		exit 2
	fi
}
