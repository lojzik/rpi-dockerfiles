FROM lojzik/rpi-debian:jessie

ENV GOGS_CUSTOM /data/gogs
ENV GOGS_FILE gogs_v0.7.19_raspi2.zip

RUN apt-get update && apt-get -y install curl unzip git openssh-server rsync net-tools \
	&& curl -O https://dl.gogs.io/$GOGS_FILE \
	&& unzip $GOGS_FILE \
	&& rm $GOGS_FILE \ 
	&& apt-get -y purge curl unzip  \
	&& apt-get -y autoremove \
	&& apt-get -y clean \
	&& rm -rf /var/lib/apt/lists/* \
	&& addgroup git \
        && adduser git --shell /bin/bash --ingroup git \
	&& sed 's@session\s*required\s*pam_loginuid.so@session optional pam_loginuid.so@g' -i /etc/pam.d/sshd \
	&& sed 's@UsePrivilegeSeparation yes@UsePrivilegeSeparation no@' -i /etc/ssh/sshd_config \
	&& sed 's@#RSAAuthentication yes@RSAAuthentication yes@' -i /etc/ssh/sshd_config \
	&& sed 's@#PubkeyAuthentication yes@PubkeyAuthentication yes@' -i /etc/ssh/sshd_config \
	&& echo "export VISIBLE=now" >> /etc/profile \
	&& echo "PermitUserEnvironment yes" >> /etc/ssh/sshd_config \
	&& echo "export GOGS_CUSTOM=/data/gogs" >> /etc/profile 

WORKDIR /gogs

ADD start.sh /gogs/
RUN chmod a+x start.sh

EXPOSE 3000 22
CMD ["./start.sh"]