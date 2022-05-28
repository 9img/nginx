FROM nginx:alpine

ENV CONF=""
ENV AUTH=""

RUN mkdir -p /etc/nginx/templates
RUN echo -e "worker_processes auto;\npid /run/nginx.pid;\nevents {\n  worker_connections 102400;\n  multi_accept on;\n}\ninclude /etc/nginx/conf.d/*.conf;" > /etc/nginx/nginx.conf
RUN echo -e "\${CONF}" > /etc/nginx/templates/default.conf.template
RUN echo -e  "#!/bin/sh\necho \$AUTH > /root/.htpasswd" > /docker-entrypoint.d/00-authbasic.sh
