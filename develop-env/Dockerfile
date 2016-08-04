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

# modify /etc/sudoers
RUN sed -i 's/Defaults\s*requiretty/#Defaults requiretty/g' /etc/sudoers

# change to +08:00
RUN yes | cp /usr/share/zoneinfo/Asia/Shanghai /etc/localtime

# clean
RUN yum -y clean all

# RUN useradd -d /home/base -m -s /bin/bash -p 123456 base
# RUN echo -e "base\tALL=(ALL)\tNOPASSWD: ALL\n" >> /etc/sudoers
# USER base

CMD /bin/bash