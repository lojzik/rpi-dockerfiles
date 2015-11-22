FROM lojzik/debian:jessie
RUN apt-get update \ 
    && apt-get install -y \
        python \
    && apt-get -y clean \
    && apt-get -y purge \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*          

#CMD ["/bin/bash"]
