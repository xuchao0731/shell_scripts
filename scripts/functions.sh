#!/bin/bash
#函数脚本
function resule(){
	if[ $0 -ne 0]
		#如果$0不等于0，为运行失败
		then
		echo -e "${RED_COLOR}$1${RES}"
		#$1为函数resule后第一个取值
	else
		echo -e "${GREEN_COLOR}$2${RES}"
		exit 1
	fi
}