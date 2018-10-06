#coding:utf-8
export LANG=UTF-8
export LANGUAGE=UTF-8

cp /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.bak
wget -O /etc/yum.repos.d/CentOS-Base.repo http://mirrors.aliyun.com/repo/Centos-7.repo
wget -P /etc/yum.repos.d/ http://mirrors.aliyun.com/repo/epel-7.repo
yum clean all
yum makecache

yum -y update
yum -y install gcc gcc-c++ 
yum -y install python-devel.x86_64 libxml2-devel 
yum -y install epel-release
yum -y install python36-devel
yum -y install python36
curl -O https://bootstrap.pypa.io/get-pip.py
sudo /usr/bin/python3.6 get-pip.py
sudo ln -s /usr/bin/python3.6 /bin/python3
pip install pqi
pqi use tuna
python3 -V && pip -V &&  pip list

#pip install django
# pip install uwsgi
#cd /home
#mkdir project
#cd project
#django-admin startproject wwww
# cd www
# django-admin startapp app
# firewall-cmd --zone=public --add-port=8000/tcp --permanent
# firewall-cmd --reload
#systemctl disable firewalld
#systemctl stop firewalld
#cd /home/wwwww
#python3 manage.py migrate
#python3 manage.py runserver

