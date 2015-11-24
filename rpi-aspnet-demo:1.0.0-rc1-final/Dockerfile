FROM lojzik/rpi-aspnet:1.0.0-rc1-final

COPY ./app /app
WORKDIR /app
RUN ["dnu", "restore"]

EXPOSE 5000
ENTRYPOINT ["dnx", "-p", "project.json", "web"]