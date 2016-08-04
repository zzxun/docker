FROM zzxun/develop-env-basic

MAINTAINER Zhang Xun <xtkml.g@gmail.com>

EXPOSE 9090

ADD start.sh /start.sh

RUN chmod +x /start.sh

RUN useradd -d /home/teamcity -m -s /bin/bash -p 123456 teamcity
RUN echo -e "teamcity\tALL=(ALL)\tNOPASSWD: ALL\n" >> /etc/sudoers

USER teamcity

EXPOSE 9090
CMD sudo -u teamcity -s -- sh -c "TEAMCITY_SERVER=$TEAMCITY_SERVER bash /start.sh run"
