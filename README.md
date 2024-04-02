
```
# create vagrant development server

vagrant init ubuntu/bionic64
vagrant up
vagrant ssh

# create django project on vagrant server

cd /vagrant
python -m venv ~/venv
source ~/venv/bin/activate
pip install -r requirments.txt

django-admin.py startproject django_project . 
python manage.py startapp profiles_api

# run django project
python manage.py runserver 0.0.0.0:8000

# generate and run migration on db
python manage.py makemigrations profiles_api
python manage.py migrate

# create django superuser
python manage.py createsuperuser



# superuser account /admin login data:
# admin@admin.com/admin

# /api/login endpoint
# used for login

# /api/profiles endpoints
# GET verbes allowed for all users without login
# logged in users can make modifications on their own profile

# /api/feeds endpoints:
# logged in user can only see and make modifications on their own feed

```