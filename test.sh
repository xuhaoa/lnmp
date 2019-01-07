#!/usr/bin/env bash

clear

keyerrorlogo='
==================================================================

           --------- Python3.6一键脚本 ----------
		   
	已在centos6/centos7/debian7/debian8/ubuntu14上测试,
			           
			其他自测！

	    （ubuntu16不要用了，直接apt-get安装吧）
		   
                                                 -----  jaz 
==================================================================';
echo "$keyerrorlogo";
echo

echo "按Enter开始安装,按Crtl+c取消........";
read;

#安装依赖
if cat /etc/issue | grep -Eqi "centos|red hat|redhat"; then
    release="centos"	
	yum install openssl openssl-devel zlib-devel gcc -y
	elif  cat /etc/redhat-release | grep -Eqi "centos|red hat|redhat"; then
	release="centos"
	yum install openssl openssl-devel zlib-devel gcc -y
	elif  cat /etc/issue | grep -Eqi "ubuntu|debian"; then
    release="debian/ubuntu"
	apt-get update
	apt-get install -y zlib1g-dev 
	apt-get install -y gcc make
	apt-get install -y libssl-dev
	apt-get install -y openssl
	apt-get install -y libreadline-dev
fi
# 下载源码
wget --no-check-certificate https://lnmp.me/ftp/Python-3.6.8.tgz
tar -zxvf Python-3.6.8.tgz
cd Python-3.6.8
mkdir /usr/local/python3.6
sed '467s/^#//g' Module/Setup
./configure --prefix=/usr/local/python3.6 --enable-shared
make
make install
if [ $? -eq 0 ];then
     echo "Python3.6.8升级完成"
else
     echo "Python3.6.8升级失败，查看报错信息手动安装"
fi
mv /usr/bin/python3 /usr/bin/python3.old >/dev/null 2>&1
ln -s /usr/local/python3.6/bin/python3 /usr/bin/python3
cp -R /usr/local/python3.6/lib/* /usr/lib64/ >/dev/null 2>&1
cp -R /usr/local/python3.6/lib/* /usr/lib/ >/dev/null 2>&1

#安装pip和setuptool
#wget --no-check-certificate https://bootstrap.pypa.io/get-pip.py
#python3 get-pip.py

#编译安装
#安装pip前需要前置安装setuptools
wget --no-check-certificate https://pypi.python.org/packages/source/s/setuptools/setuptools-19.6.tar.gz#md5=c607dd118eae682c44ed146367a17e26
tar -zxvf setuptools-19.6.tar.gz
cd setuptools-19.6
python3 setup.py build
python3 setup.py install
#安装pip 
wget --no-check-certificate https://pypi.python.org/packages/11/b6/abcb525026a4be042b486df43905d6893fb04f05aac21c32c638e939e447/pip-9.0.1.tar.gz#md5=35f01da33009719497f01a4ba69d63c9
tar -zxvf pip-9.0.1.tar.gz
cd pip-9.0.1
python3 setup.py build
python3 setup.py install


if [ $? -eq 0 ];then
     echo "pip3升级完成"
else
     echo "pip3安装失败，查看报错信息手动安装"
fi
mv /usr/bin/pip3 /usr/bin/pip3.old  >/dev/null 2>&1
ln -s /usr/local/python3.6/bin/pip3 /usr/bin/pip3
