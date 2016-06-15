FROM debian

RUN apt-get update && apt-get upgrade -y
RUN apt-get install -y nginx

RUN mkdir /tmp/letsencrypt-auto

RUN cd / && git clone https://github.com/certbot/certbot.git

COPY letsencrypt.conf /etc/nginx/conf.d


RUN rm -rf /var/lib/apt/lists/*
