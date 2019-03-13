FROM ubuntu1604:base

LABEL description="Hue Project https://github.com/cloudera/hue"

ADD . /usr/lib
WORKDIR /hue

WORKDIR  /usr/lib/hue

EXPOSE 8888
CMD ["./startup.sh"]
