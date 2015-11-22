FROM lojzik/python:latest
RUN apt-get update \ 
    && apt-get install -y \
        git \
        python-smbus \
    && git clone https://github.com/adafruit/Adafruit-Raspberry-Pi-Python-Code.git \
    && apt-get -y purge git \
    && apt-get -y autoremove \
    && apt-get -y clean \
    && apt-get -y purge \
    && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* \          
     

#CMD ["/bin/bash"]
