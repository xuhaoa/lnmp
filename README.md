# LNMP (Linux + Nginx + MySQL + Python)一键包
## 官网 ： https://lnmp.me

注意：只支持**Centos7** !~~~ **CentOS7** ~~ 破音

### 安装信息： 

 - Nginx 1.14.2 
 - MySQL5.6.42
 - Python 3.6.6
 - pip 18.1
 - --- pipenv （牛逼的虚拟环境和依赖管理工具）
 - --- pqi     (切换pip源，国内必装)

### LNMP一键安装命令如下 (只支持Centos7)：

    yum install -y wget && wget -O install.sh https://lnmp.me/ftp/install.sh --no-check-certificate && sh install.sh
    
    
### 仅安装Python3.6 命令如下 (只支持Centos7):

    yum install -y wget && wget -O py3.sh https://lnmp.me/ftp/py3.sh --no-check-certificate && sh py3.sh

## MySQL篇

 1. `mysql_secure_installation` 设置数据库密码(ssh运行， 用于 **生 产 环 境** 设置）)

 - `Enter current password for root (enter for none): ` 输入密码，没有密码所以直接回车
 -  `Set root password? [Y/n] `  设置root密码  Y  
 -  `Remove anonymous users? [Y/n] `  生产环境建议删除系统创建的匿名用户  Y
 -  `Disallow root login remotely? [Y/n] `  禁止root用户远程登录  Y
 -  `Remove test database and access to it? [Y/n] `  删除test数据库  Y
 -  `Reload privilege tables now? [Y/n] `  重载权限表  Y
>  ... Success! 巴拉巴拉(省略)  Cleaning up...    完成~~~

 2. 登录 `mysql -u root -p`  ,按提示输入密码。 测试 ： `show databases;`
 3. `exit;` 退出Mysql环境

## Python3篇
 1. (可选)进入项目路径 `cd /www/app` 或者 建立项目文件夹 `mkdir /www/ && mkdir /www/app`  

 2. 进入项目的虚拟化环境  `pipenv shell` ，此时ssh的输入提示符应该是 `(项目名)[登录用户@主机名 项目名]#`

 3.  验证python3和pip是否安装成功：
    `python -V && pip -V`

提示如下 则进入成功：

        (app) [root@VM app]# python -V && pip -V
        Python 3.6.6
        pip 19.0.3 from /root/.local/share/virtualenvs/app-EIlACzsd/lib/python3.6/site-packages/pip (python 3.6)
        
## Nginx篇
 1. 访问主机ip 显示如下则nginx安装成功且运行成功

> Welcome to nginx!
> ....
>  巴拉巴拉(省略)
> ...
> Thank you for using nginx.

## 防火墙设置

 1. 脚本默认是开放http（80端口）
 2. 基本操作
- 开启了哪些服务和端口：`firewall-cmd --list-all`
- 查端口：`firewall-cmd --permanent --query-port=80/tcp` 
- 增加端口: `firewall-cmd --zone=public --add-port=80/tcp --permanent`
- 删除端口：`firewall-cmd --permanent --remove-port=80/tcp `
 3. 重启防火墙 `systemctl restart firewalld`
