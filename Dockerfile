FROM nginx:1.24.0
COPY ./html /usr/share/nginx/html
ENV PORT 80
EXPOSE $PORT
CMD /bin/sed -i -e "s/listen 80 default_server;/listen $PORT default_server;/" /etc/nginx/conf.d/default.conf && /bin/sed -i -e "s/listen \[::\]:80 default_server;/listen \[::\]:$PORT default_server;/" /etc/nginx/conf.d/default.conf && /bin/sed -i -e "s/\$HOSTNAME/$HOSTNAME/" /usr/share/nginx/html/index.html && /usr/sbin/nginx -g 'daemon off;'