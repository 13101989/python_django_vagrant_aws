#!usr/bin/env bash

sudo set -e

PROJECT_BASE_PATH='/usr/local/apps/python_django_vagrant_aws'

sudo git pull origin main
sudo $PROJECT_BASE_PATH/venv/bin/python manage.py migrate
sudo $PROJECT_BASE_PATH/venv/bin/python manage.py collectstatic --noinput
sudo supervisorctl restart profiles_api