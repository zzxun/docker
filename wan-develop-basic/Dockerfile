FROM centos:6

MAINTAINER Zhang Xun <xtkml.g@gmail.com>

# epel repo
RUN yum -y install epel-release \
	&& yum -y update \
	&& yum -y install sudo wget unzip tar git systemd glib-devel

# gcc
RUN wget http://people.centos.org/tru/devtools-2/devtools-2.repo -O /etc/yum.repos.d/devtools-2.repo \
	&& yum -y install devtoolset-2-gcc devtoolset-2-binutils devtoolset-2-gcc-c++ \
	&& ln -s /opt/rh/devtoolset-2/root/usr/bin/* /usr/local/bin/ \
	&& hash -r

# mysql
RUN wget http://repo.mysql.com/mysql-community-release-el6-7.noarch.rpm \
	&& rpm -ivh mysql-community-release-el6-7.noarch.rpm \
	&& rm -rf mysql-community-release-el6-7.noarch.rpm \
	&& yum -y install mysql-server

# reids
RUN cd ~/ \
    && wget http://download.redis.io/releases/redis-stable.tar.gz \
	&& tar xzvf redis-stable.tar.gz \
	&& rm redis-stable.tar.gz \
	&& cd redis-stable \
	&& make \
	&& make install \
	&& cd .. \
	&& rm -rf redis-stable

# mongodb and open reomote connection
RUN { \
		echo '[mongodb-org-3.2]'; \
		echo 'name=MongoDB Repository'; \
		echo 'baseurl=https://repo.mongodb.org/yum/redhat/$releasever/mongodb-org/3.2/x86_64/'; \
		echo 'gpgcheck=1'; \
		echo 'enabled=1'; \
		echo 'gpgkey=https://www.mongodb.org/static/pgp/server-3.2.asc'; \
	} > /etc/yum.repos.d/mongodb-org-3.2.repo \
	&& yum -y install mongodb-org \
	&& sed -i 's/bindIp/#bindIp/g' /etc/mongod.conf

# modify /etc/sudoers
RUN sed -i 's/Defaults\s*requiretty/#Defaults requiretty/g' /etc/sudoers

# change to +08:00
RUN yes | cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

EXPOSE 3306
EXPOSE 6379
EXPOSE 27017

# clean
RUN yum -y clean all

ADD start.sh /start.sh
RUN chmod +x /start.sh

# RUN useradd -d /home/base -m -s /bin/bash -p 123456 base
# RUN echo -e "base\tALL=(ALL)\tNOPASSWD: ALL\n" >> /etc/sudoers
# USER base

CMD sh -c "bash /start.sh run"