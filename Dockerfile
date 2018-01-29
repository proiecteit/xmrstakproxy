FROM proiecteit/xmrstak

RUN rm /start.sh

ADD start.sh /

RUN chmod +x /start.sh

ENTRYPOINT ["/start.sh"]
