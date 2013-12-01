#!/usr/bin/env bash

#install and update packages
yum groupinstall "Development tools"
yum install -q -y zlib-devel bzip2-devel openssl-devel ncurses-devel sqlite-devel readline-devel tk-devel 
yum install -q -y unzip
yum update -q -y

cd /tmp
rm -rf /tmp/Python*
wget -q http://python.org/ftp/python/2.7.6/Python-2.7.6.tgz
tar xfz Python-2.7.6.tgz
cd Python-2.7.6
./configure --prefix=/usr/local
make --quiet && make --quiet altinstall

cd /tmp
wget --no-check-certificate -q https://pypi.python.org/packages/source/d/distribute/distribute-0.7.3.zip
unzip distribute-0.7.3.zip
cd distribute-0.7.3
/usr/local/bin/python2.7 setup.py install
/usr/local/bin/easy_install-2.7 pip
/usr/local/bin/pip-2.7 install virtualenv

#http://python.org/ftp/python/2.7.6/Python-2.7.6.tgz

#apt-get update
#apt-get install -y apache2

#setup vagrant as www folder
#rm -rf /var/www
#ln -fs /vagrant /var/www

