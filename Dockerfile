FROM python:3.7

MAINTAINER root@recolic.net
ARG GIT_REPO_TM_WEB

EXPOSE 80/tcp

RUN apt update -y && apt install -y git expect fish
RUN mkdir /app /app/log /app/keys
VOLUME /app/log
VOLUME /app/keys
WORKDIR /app

RUN git clone "$GIT_REPO_TM_WEB" src 

COPY entry.sh /app/entry.sh
RUN chmod +x entry.sh

CMD /app/entry.sh

