FROM lojzik/debian:jessie

EXPOSE 80 443
CMD ["nginx", "-g", "daemon off;"]

RUN echo "deb http://debian.mirror.web4u.cz jessie-backports main contrib non-free" >> /etc/apt/sources.list && \

apt-get update \ 
  && apt-get -t jessie-backports install -y \
        nginx-full \
	&& apt-get -y clean \
	&& apt-get -y purge \
	&& rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*        

# forward request and error logs to docker log collector
#RUN ln -sf /dev/stdout /var/log/nginx/access.log
#RUN ln -sf /dev/stderr /var/log/nginx/error.log

#VOLUME ["/var/cache/nginx", "/var/www/html","/etc/nginx","/var/log/nginx"]

#VOLUME ["/var/cache/nginx"]
