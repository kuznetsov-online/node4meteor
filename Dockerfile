FROM node:4.8.0

ENV DEBIAN_FRONTEND noninteractive

RUN \
    curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - &&\
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list &&\
    apt-get update &&\
    apt-get -y dist-upgrade &&\
    apt-get -y install graphicsmagick yarn &&\
    apt-get -y autoremove &&\
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/* &&\
    npm update -g &&\
    npm cache clean

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

EXPOSE 80
CMD ["/entrypoint.sh"]
