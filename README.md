# webapp-stack
docker-react-django-postgresql

## Setting Up PostgreSQL in Django
Adjust your Django settings. Open the myproject/settings.py file and modify the DATABASES section as follows:
```console
DATABASES = {
    "default": {
        "ENGINE": os.environ.get("SQL_ENGINE", "django.db.backends.sqlite3"),
        "NAME": os.environ.get("SQL_DATABASE", BASE_DIR / "db.sqlite3"),
        "USER": os.environ.get("SQL_USER", "user"),
        "PASSWORD": os.environ.get("SQL_PASSWORD", "password"),
        "HOST": os.environ.get("SQL_HOST", "localhost"),
        "PORT": os.environ.get("SQL_PORT", "5432"),
    }
}
```

## Building containers
To build application, use the following command from the project root:
```console
docker compose build
```

## Running the containers
The running of our containers is as simple as running the following command:
```console
docker compose up 
or 
docker compose up --build #for auto build
or 
docker compose up --build -V #for auto build and recreate volume
```
After this, the servers are accessible at the ports 3000 for frontend, 8000 for backend and 5432 for db. 
Visit [here](http://localhost:3000) and you must see the react default page.
and [here](http://127.0.0.1:8000/) for the default 'django is running' page.

## Run the migrations
```console
docker compose exec backend python manage.py migrate --noinput
```

> Get the following error?
>
> ```console
> django.db.utils.OperationalError: FATAL:  database "django_db_dev" does not exist
> ```
>
> Run docker-compose down -v to remove the volumes along with the containers. Then, re-build the images, run the containers, and apply the migrations.

## Ensure the default Django tables were created
```console
docker compose exec my-postgres psql --username=hello_django --dbname=django_db_dev
psql (14.15)
Type "help" for help.

django_db_dev=# \l
                                          List of databases
       Name       |    Owner     | Encoding |  Collate   |   Ctype    |       Access privileges       
------------------+--------------+----------+------------+------------+-------------------------------
 django_db_dev | hello_django | UTF8     | en_US.utf8 | en_US.utf8 | 
 postgres         | hello_django | UTF8     | en_US.utf8 | en_US.utf8 | 
 template0        | hello_django | UTF8     | en_US.utf8 | en_US.utf8 | =c/hello_django              +
                  |              |          |            |            | hello_django=CTc/hello_django
 template1        | hello_django | UTF8     | en_US.utf8 | en_US.utf8 | =c/hello_django              +
                  |              |          |            |            | hello_django=CTc/hello_django
(4 rows)

django_db_dev=# \c django_db_dev
You are now connected to database "django_db_dev" as user "hello_django".
django_db_dev=# \dt
                     List of relations
 Schema |            Name            | Type  |    Owner     
--------+----------------------------+-------+--------------
 public | auth_group                 | table | hello_django
 public | auth_group_permissions     | table | hello_django
 public | auth_permission            | table | hello_django
 public | auth_user                  | table | hello_django
 public | auth_user_groups           | table | hello_django
 public | auth_user_user_permissions | table | hello_django
 public | django_admin_log           | table | hello_django
 public | django_content_type        | table | hello_django
 public | django_migrations          | table | hello_django
 public | django_session             | table | hello_django
(10 rows)

django_db_dev=# \q
```

# Appendix
## Manually flush & migrate
```console
docker compose exec backend python manage.py flush --no-input
docker compose exec backend python manage.py migrate
```

## Update the file permissions locally
```coonsole
$ chmod +x backend_django/entrypoint.sh
$ chmod +x backend_django/entrypoint.prod.sh
```

## Build the production images and spin up the containers
```console
docker compose down -v
docker compose -f docker-compose.prod.yml up -d --build
```

## Stop and remove containers, networks
To stop the containers we can just press Ctrl+C or we can use the following command:
```console  
docker compose down --remove-orphans --rmi all  
```
Note: The docker compose down command will remove the default network created and stop and remove the containers as well.