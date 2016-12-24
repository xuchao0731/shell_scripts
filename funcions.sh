#!/bin/bash
source . /alert.sh
#用来判断上一步执行的正确与否
funciton result(){
if [ $? -ne 0]
then 
echo 'yum安装需要的插件失败'
echo -e  "${RED_COLOR}$1${RES}"
exit 1
fi
}
#判断用户是否为root
function ifRoot(){
if [ $UID -ne 0]
then 
echo -e  "${RED_COLOR}当前用户为普通用户，需要切换到root用户执行该脚本${RES}"
exit 2
fi
}