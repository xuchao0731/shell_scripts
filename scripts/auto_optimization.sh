#!/bin.bash
#date:206-12-26
#intro:Sseakom
#自动运行初步yum安装所需插件，自动更新yum源
#配置ssh登录用户为admin，设置sudo权限
#前提：网络OK
echo "开始yum安装所需的插件"
yum install -y net-toos vim wget sudo >> /dev/null 2>&1
result "执行yum安装失败" "执行yum安装成功"
echo -e "${PINK_COLOR}开始更新yum源${RES}"
#备份；创建一个backup文件夹
mkdir -p ${yumSource_pathbackup}
#将yum.repos.d原内容移动至backup文件夹
mv ${yumSource_path}./*repo ${yumSource_pathbackup}
#/usr/bin/ls -l ${yumSource_pathbackup}
#——此条命令为查看backup文件夹中是否已导入
cd ./src && cp -r 163.repo ${yumSource_path} && cd ..
#进入src文件夹，将163.repo拷贝到yum.repos.d文件夹，之后回到shell_scripts文件夹
(yum clean all && yum makecache && yum upgrade -y) >> /dev/null 2>&1 
#清理、释放、升级
resule "执行yum源更新失败" "执行yum源更新成功"
echo "创建本地用户"
useradd admin
#创建admin用户
echo "admin:123456" | chpasswd
#非交互式赋予密码，将123456，赋予admin
echo "admin ALL=(root) ALL, !/usr/bin/passwd [A-Za-z]*, !/usr/bin/passwd root" >> etc/sudoers
result "添加admin用户、sudo权限失败" "添加admin用户、sudo权限成功"
#修改ssh的默认22端口为2222端口
sed -i "s/\#Port 22 /Port 2222/g" ${sshConfig_path}
#将#Port 22替换为Port 2222
systemctl restart sshd
result "配置ssh失败" "配置ssh成功"
#创建lock文件
cd ./lock && touch optimization.lock && cd ../