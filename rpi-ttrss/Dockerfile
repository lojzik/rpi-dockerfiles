FROM lojzik/rpi-php-cli
RUN apt-get update \ 
    && apt-get install -y \
        cron \
        git

RUN git clone https://tt-rss.org/gitlab/fox/tt-rss.git
RUN mkdir /data \
	&& echo > /data/config.php \
	&& ln -s /data/config.php /tt-rss/config.php
RUN chmod -R 777 /tt-rss/cache/images
RUN chmod -R 777 /tt-rss/cache/upload
RUN chmod -R 777 /tt-rss/cache/export
RUN chmod -R 777 /tt-rss/cache/js
RUN chmod -R 777 /tt-rss/feed-icons
RUN chmod -R 777 /tt-rss/lock
USER www-data
CMD ["php","/tt-rss/update.php","--daemon"]	 