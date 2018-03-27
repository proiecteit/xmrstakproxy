FROM proiecteit/common

ADD start.sh /
ADD pools.txt /
ADD config.txt /

RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]
