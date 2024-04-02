#!usr/bin/env bash

set -e

PROJECT_BASE_PATH='/usr/local/apps/python_django_vagrant_aws'

sudo git pull origin main
cd $PROJECT_BASE_PATH && /usr/local/apps/python_django_vagrant_aws/venv/bin/python manage.py migrate
cd $PROJECT_BASE_PATH && $PROJECT_BASE_PATH/venv/bin/python manage.py collectstatic --noinput
sudo supervisorctl restart profiles_api