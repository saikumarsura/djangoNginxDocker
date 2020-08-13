#we are picking an user based nginx for alpaine
FROM nginxinc/nginx-unprivileged:1-alpine

# we will mover our nginx file to the container were nginx is running
COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./uwsgi_params /etc/nginx/uwsgi_params

# switch to root user for 
USER root

RUN mkdir -p /vol/static
RUN chmod 755 /vol/static

# switch back to user 
USER nginx

