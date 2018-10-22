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
curl -O https://bootstrap.pypa.io/get-pip.py -k
sudo /usr/bin/python3.6 get-pip.py
sudo ln -s /usr/bin/python3.6 /bin/python3
pip install pqi
pqi use tuna
pip install virtualenv
pip install virtualenvwrapper
pip install Beaker
pip install Tablib
pip install glances
python3 -V && pip -V &&  pip list
