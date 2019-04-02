FROM alpine
COPY . /tmp
RUN apk add --no-cache lighttpd; \
mv /tmp/lighttpd.conf /etc/lighttpd/; \
mv /tmp/index.sh /var/www/localhost/htdocs/
CMD ["lighttpd", "-D", "-f", "/etc/lighttpd/lighttpd.conf"]
