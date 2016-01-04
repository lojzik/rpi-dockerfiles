FROM lojzik/rpi-php-cli
RUN apt-get update \ 
    && apt-get install -y \
        git-core \
	&& git clone https://tt-rss.org/gitlab/fox/tt-rss.git \
	&& mkdir /data \
	&& echo > /data/config.php \
	&& ln -s /data/config.php /tt-rss/config.php \
	&& chmod -R 777 /tt-rss/cache/images \
	&& chmod -R 777 /tt-rss/cache/upload \
	&& chmod -R 777 /tt-rss/cache/export \
	&& chmod -R 777 /tt-rss/cache/js \
	&& chmod -R 777 /tt-rss/feed-icons \
	&& chmod -R 777 /tt-rss/lock \
	&& apt-get -y remove git-core \
	&& apt-get -y autoremove \
    && apt-get -y clean \
    && apt-get -y purge \
	&& rm -rf /tt-rss/.git \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*     
USER www-data
CMD ["php","/tt-rss/update.php","--daemon"]	 