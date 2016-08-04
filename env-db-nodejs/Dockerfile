FROM zzxun/develop-env-basic

MAINTAINER Zhang Xun <xtkml.g@gmail.com>

# Install Node.js
RUN curl --location https://raw.github.com/creationix/nvm/master/install.sh | sh \
    && /bin/bash -c "echo \"[[ -s \$HOME/.nvm/nvm.sh ]] && . \$HOME/.nvm/nvm.sh\" >> /etc/profile.d/npm.sh" \
	&& echo "[[ -s $HOME/.nvm/nvm.sh ]] && . $HOME/.nvm/nvm.sh" >> $HOME/.bashrc

ENV PATH $HOME/.nvm/bin:$PATH

RUN nvm install 4.4.4 \
    && node -v \
    && npm install npm -g cnpm grunt grunt-cli mocha istanbul


ADD start.sh /start.sh

RUN chmod +x /start.sh

CMD sh -c "bash /start.sh run"