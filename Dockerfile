FROM alpine:3.17.3
RUN  apk add lighttpd --no-cache 
RUN  rm -rvf /var/cache/apk/* 
RUN  rm -rvf /etc/lighttpd/* 
RUN  rm -rvf /etc/logrotate.d/lighttpd /var/log/lighttpd
 RUN rm -rvf /var/www/localhost 
RUN  mkdir -vp /var/www/html
RUN ls -la /etc/lighttpd/
COPY files/lighttpd/ /etc/lighttpd/

EXPOSE 80/tcp

ENTRYPOINT ["/usr/sbin/lighttpd"]
CMD ["-D", "-f", "/etc/lighttpd/lighttpd.conf"]
