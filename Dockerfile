# picking a lit weight image 
FROM python:3.8-alpine

# Add scripts to the path of the runnning container
ENV PATH="/scripts:${PATH}"

#This will copy our requirements to the container
COPY ./requirements.txt /requirements.txt

# Required Alpine packages to install uWSGI
RUN apk add --update --no-cache --virtual .tmp gcc libc-dev linux-headers

#
RUN pip install -r /requirements.txt

#lets remove no required packages --> to make build light wegiht
RUN apk del .tmp

RUN mkdir /app
COPY ./app /app
WORKDIR /app
COPY ./scripts /scripts

RUN chmod +x /scripts/*

# -p give max permisions to create  all the folders
RUN mkdir -p /vol/web/media
RUN mkdir -p /vol/we/static

# If appliction get attacked by any hacker this appliaction will only have user permissions not root permissions
RUN adduser -D user 

RUN chown -R user:user /vol
RUN chmod -R 755 /vol/web

USER user

CMD ["entrypoint.sh"]