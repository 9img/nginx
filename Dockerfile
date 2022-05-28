FROM nginx:alpine

ENV CONF=""
ENV AUTH=""

RUN echo "include /etc/nginx/conf.d/*.conf" > /etc/nginx/nginx.conf
RUN echo "\${CONF}" > /etc/nginx/templates/default.conf.template
RUN echo "#!/bin/sh\necho \$AUTH > /root/.htpasswd" > /docker-entrypoint.d/00-authbasic.sh
