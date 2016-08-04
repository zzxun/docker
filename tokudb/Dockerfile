FROM zzxun/develop-basic

MAINTAINER Zhang Xun <xtkml.g@gmail.com>

# mysql with tokudb
RUN yum install http://www.percona.com/downloads/percona-release/percona-release-0.0-1.x86_64.rpm \
  && yum install jemalloc \
  && yum install Percona-Server-server-57.x86_64 \
  && yum install Percona-Server-tokudb-56.x86_64

EXPOSE