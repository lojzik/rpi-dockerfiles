FROM lojzik/php-cli:latest
RUN apt-get update \ 
    && apt-get install -y \
    php5-fpm \
    && apt-get -y clean \
    && apt-get -y purge \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \          
    && sed 's/;daemonize = yes/daemonize = no/' -i /etc/php5/fpm/php-fpm.conf  \
    && sed 's|listen = /var/run/php5-fpm.sock|listen = 0.0.0.0:9000|' -i /etc/php5/fpm/pool.d/www.conf
            
CMD ["php5-fpm"]
EXPOSE 9000