#!/usr/bin/env bash

sudo set -e

PROJECT_GIT_URL='https://github.com/13101989/python_django_vagrant_aws.git'
PROJECT_BASE_PATH='/usr/local/apps/python_django_vagrant_aws'

sudo echo "Installing dependencies..."
sudo apt-get update
sudo apt-get install -y python3-dev python3-venv python3-pip sqlite supervisor nginx git

# Create project directory and clone project
sudo mkdir -p $PROJECT_BASE_PATH
sudo git clone $PROJECT_GIT_URL $PROJECT_BASE_PATH

# Create virtualenv
sudo python3 -m venv $PROJECT_BASE_PATH/venv

# Install python packages
sudo $PROJECT_BASE_PATH/venv/bin/pip install -r $PROJECT_BASE_PATH/requirements.txt
sudo $PROJECT_BASE_PATH/venv/bin/pip install uwsgi==2.0.18

# Run migrations and collectstatic
sudo cd $PROJECT_BASE_PATH
sudo $PROJECT_BASE_PATH/venv/bin/python manage.py migrate
sudo $PROJECT_BASE_PATH/venv/bin/python manage.py collectstatic --noinput

# Configure supervisor
sudo cp $PROJECT_BASE_PATH/deploy/supervisor_python_django.conf /etc/supervisor/conf.d/python_django.conf