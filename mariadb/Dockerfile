FROM zzxun/develop-mongo

MAINTAINER Zhang Xun <xtkml.g@gmail.com>

# mariadb
RUN { \
    echo '[mariadb]'; \
    echo 'name=MariaDB'; \
    echo 'baseurl = http://yum.mariadb.org/10.1/centos6-amd64'; \
    echo 'gpgkey=https://yum.mariadb.org/RPM-GPG-KEY-MariaDB'; \
    echo 'gpgcheck=1'; \
  } > /etc/yum.repos.d/MariaDB.repo \
  && yum -y install MariaDB-server MariaDB-client

EXPOSE 3306

# clean
RUN yum -y clean all

ADD start.sh /start.sh
RUN chmod +x /start.sh

CMD sh -c "bash /start.sh run"
