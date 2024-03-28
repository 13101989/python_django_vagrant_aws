
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
python manage.py startapp django_api

# run django project
python manage.py runserver 0.0.0.0:8000
```