FROM nginx

# Preparar ambiente
RUN apt-get update
RUN curl -fsSL https://deb.nodesource.com/setup_19.x | bash - && apt-get install -y nodejs
RUN npm install pm2 -g

# Copiar servicos
COPY src/service1 /var/www/service1
RUN cd /var/www/service1 && npm install

COPY src/service2 /var/www/service2
RUN cd /var/www/service2 && npm install

COPY ecosystem.config.js /root/ecosystem.config.js

# Nginx config
COPY nginx.conf /etc/nginx/nginx.conf

CMD pm2 start /root/ecosystem.config.js; nginx -g 'daemon off;'