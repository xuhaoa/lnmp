#!/usr/bin/env bash

#coding:utf-8 
export LANG=UTF-8
export LANGUAGE=UTF-8

#更改yum源和epel源到阿里云
yum -y install epel-release
cp /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
wget -P /etc/yum.repos.d/ http://mirrors.aliyun.com/repo/epel-7.repo
yum clean all
yum makecache

#更新并安装组件
#yum -y update
yum -y install gcc gcc-c++ 
yum -y install python-devel.x86_64 libxml2-devel 

#安装Nginx ( https://segmentfault.com/a/1190000017781356 )yum install -y wget   
rpm -ivh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
yum install -y nginx
systemctl start nginx
systemctl enable nginx.service

#安装MySQL   ( https://blog.csdn.net/javandroid/article/details/81225839 )
rpm -Uvh http://dev.mysql.com/get/mysql-community-release-el7-5.noarch.rpm
yum -y install mysql-community-server
systemctl enable mysqld
systemctl start mysqld
#mysql_secure_installation 重置数据库密码(ssh运行)

#防火墙设置
firewall-cmd --zone=public --add-port=80/tcp --permanent
#systemctl stop firewalld
#systemctl disable firewalld
firewall-cmd --reload

#安装Python pip
yum -y install python36-devel
yum -y install python36
curl -O https://bootstrap.pypa.io/get-pip.py -k
sudo /usr/bin/python3.6 get-pip.py
sudo ln -s /usr/bin/python3.6 /bin/python3
pip install pqi
pqi use tuna
pip install pipenv

echo "$====================版本信息如下=================";

nginx -v && mysql -V && python3 -V && pip -V
