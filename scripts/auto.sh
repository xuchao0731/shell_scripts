#!/bin/bash
#author:
#date:
#intro:
#自动运行初步yum安装所需插件，自动更新yum源
#配置ssh登录用户为admin，设置sudo权限
source ./alert.sh #引用alert.sh的变量
source ./functions.sh #引用functions的函数
#判断当前用户登录用户是否为root，只有root才有权限执行该脚本
ifRoot #调用function.sh函数
echo "开始yum安装所需要的插件"
yum instal -y net-tools vim >> /dev/null 2>&1 #(./auto.log)  不刷屏
#调用functions.sh中的result函数
result "执行yum失败"
#echo $? #判断执行命令是否正确
echo "更新yum源"
yumSource_path='/etc/yum.repos.d'
echo ${yumSource_path} #输出路径