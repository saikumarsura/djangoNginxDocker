#!/bin/sh

#if anything got worng exit this script with 0 value-> debug
set -e
# this will pick all the files to the django appliction which will help to pick static files
python manage.py collectstatic --noinput
# this the command that runs our applications using uwsgi
# uwsgi just a name of the aplliction to run 
# --socket means we are telling it to run as tcp 
# 8000 we are using port 
# --master measn we asking to run this appication as master to have max 
#  --enable-threads we asking to run on threads 
# --module pick th app.wsgi
uwsgi --socket :8000 --master --enable-threads --module app.wsgi
