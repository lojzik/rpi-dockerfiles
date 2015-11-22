FROM lojzik/debian:jessie
RUN apt-get update \ 
    && apt-get install -y \
        php-pear \
        php5-cli \
        php5-common \
        php5-curl \
        php5-gd \
        php5-imap \
        php5-intl \
        php5-ldap \
        php5-mysqlnd \
        php5-pgsql \
        php5-recode \
        php5-sqlite \
        php5-tidy \
        php5-xmlrpc \
        php5-xsl \
    && apt-get -y clean \
    && apt-get -y purge \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*          

#CMD ["/bin/bash"]
