FROM proiecteit/xmrstak

RUN rm -f /pools.txt

ADD pools.txt /

ENTRYPOINT ["/nescafe"]
