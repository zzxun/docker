FROM zzxun/develop-base

MAINTAINER Zhang Xun <xtkml.g@gmail.com>

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

EXPOSE 6379
EXPOSE 27017

# clean
RUN yum -y clean all

CMD /bin/bash