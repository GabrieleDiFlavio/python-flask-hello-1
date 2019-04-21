FROM debian:jessie
ENV  DEBIAN_FRONTEND noninteractive

RUN  apt-get -q update \
&& RUN apt-get -y install python3 python3-dev python3-pip build-essential libgmp-dev libmpfr-dev libmpc-dev \
&& pip3 install Flask \
&& pip3 install gmpy2 \
&& pip3 install netifaces \
&& apt-get purge -y --auto-remove python3-dev build-essential


EXPOSE 8080
COPY /app /app

ENTRYPOINT ["/usr/bin/python3", "/app/app.py"]
