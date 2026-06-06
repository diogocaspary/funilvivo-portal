FROM nginx:alpine

# Portal estático da Funil Vivo
COPY index.html /usr/share/nginx/html/index.html
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80
