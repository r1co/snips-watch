FROM ubuntu

RUN apt-get update && apt-get install -y dirmngr apt-transport-https ca-certificates

RUN  echo "deb https://debian.snips.ai/stretch stable main" > /etc/apt/sources.list.d/snips.list
RUN  apt-key adv --keyserver gpg.mozilla.org --recv-keys F727C778CCB0A455

RUN apt-get update && apt-get install -y \
    snips-watch \
 && rm -rf /var/lib/apt/lists/*

VOLUME ["/etc/snips", "/var/lib/snips", "/usr/share/snips"]

ENTRYPOINT ["snips-watch"]
CMD ["--config","/etc/snips/snips.toml", "-vvv"]