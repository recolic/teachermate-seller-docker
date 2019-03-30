FROM python:3.7

MAINTAINER root@recolic.net

RUN apt install -y git expect
RUN mkdir /app /app/log /app/keys
VOLUME /app/log
VOLUME /app/keys
WORKDIR /app

COPY entry.sh /app/entry.sh
RUN chmod +x entry.sh

CMD /app/entry.sh

