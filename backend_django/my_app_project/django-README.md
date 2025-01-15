# Python Application  

# Setup Django application 
```console
cd backend_django
```

## Create virtual environment  
```console  
python -m venv .venv  
```

## Activate venv  
### Windows:
```console  
.venv\Scripts\activate  
```
### Linux/Unix
```console
source ./venv/bin/activate
```

## Install Django dependencies
```console
pip install django djangorestframework django-cors-headers psycopg2-binary
```
OR
```
pip install -r requirements.txt
```

django, the package for the framework.
djangorestframework, the framework for Django to build rest APIs.
django-cors-headers, a Django app to add CORS headers to the application.
psycopg2-binary, PostgreSQL Database adapter for python.

## Create a requirements file
```console
pip freeze > requirements.txt
```

## Create a Django project
Let us create a django project by using the following command:
```console
django-admin startproject my_app_project
```
Note: The **my_app_project** is the name of the Django project name it whatever you want.
You'll see a project named **my_app_project** in your workspace.

## Start the project
```console  
cd my_app_project
python manage.py runserver
```
Make sure the virtual environment is active.
Note: The **my_app_project** is the name of the Django project name.

Visit http://localhost:8000 to see the default Django page.


<!-- 
## You will see the result like this:  
![Alt text](img/RunPyWithVenv.png)

## Deactivate venv  
```console  
deactivate  
```

# Run with docker  
## Create Docker Container  
```console  
docker compose up --build  
```


## Stop and remove containers, networks  
```console  
docker compose down --remove-orphans --rmi all  
``` -->