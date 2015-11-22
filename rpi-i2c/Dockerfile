FROM lojzik/rpi-raspbian:jessie
RUN apt-get update && apt-get install -y \
        i2c-tools \
	&& apt-get -y clean \
	&& apt-get -y purge \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*               
