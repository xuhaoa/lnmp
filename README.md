# LNMP (Linux + Nginx + MySQL + Python)一键包
## 官网 ： https://lnmp.me

注意：只支持Centos7 !~~~ CentOS7 ~~ 破音

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

## 使用步骤
 1. 进入项目路径 `cd /www/app` 或者 建立项目文件夹 `mkdir /www/ && mkdir /www/app` 

 2. 进入项目的虚拟化环境  `pipenv shell` ，此时ssh的输入提示符应该是 `(项目名)[登录用户@主机名 项目名]#`1
 
 3. 验证安装是否成功：。
    `python -V && pip -V`
提示如下 则进入成功：

        (app) [root@VM app]# python -V && pip -V
        Python 3.6.6
        pip 19.0.3 from /root/.local/share/virtualenvs/app-EIlACzsd/lib/python3.6/site-packages/pip (python 3.6)
 4. 基础必备
    pipenv ： https://pypi.org/project/pipenv/
    python3 : https://docs.python.org/zh-cn/3.6/tutorial/index.html



