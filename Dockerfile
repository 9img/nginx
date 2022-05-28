FROM nginx:alpine

ENV CONF=""
ENV AUTH=""

RUN mkdir -p /etc/nginx/templates
RUN echo -e "include /etc/nginx/conf.d/*.conf;" > /etc/nginx/nginx.conf
RUN echo -e "\${CONF}" > /etc/nginx/templates/default.conf.template
RUN echo -e  "#!/bin/sh\necho \$AUTH > /root/.htpasswd" > /docker-entrypoint.d/00-authbasic.sh
