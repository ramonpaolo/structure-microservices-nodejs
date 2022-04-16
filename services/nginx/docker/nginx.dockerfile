FROM nginx:1.21-alpine

LABEL maintainer "Ramon Paolo Maran"

EXPOSE 80 443

RUN rm -r /etc/nginx/conf.d/default.conf

COPY ./services/nginx/docker/conf/nginx.conf /etc/nginx/conf.d/

CMD ["nginx", "-g", "daemon off;"]