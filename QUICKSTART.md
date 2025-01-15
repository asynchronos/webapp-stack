# webapp-stack
docker-react-django-postgresql

## Build the containers
```console
docker compose build
```

## Running the containers
The running of our containers is as simple as running the following command:
```console
docker compose up
```

## Run the migrations
```console
docker compose exec backend python manage.py migrate --noinput
```

After this, the servers are accessible at the ports 3000 for frontend, 8000 for backend and 5432 for db. 
Visit [here](http://localhost:3000) and you must see the react default page.
and [here](http://127.0.0.1:8000/) for the default 'django is running' page.

## Remove the containers
```console
docker compose doown
OR
docker compose doown -V
```

## Re-Build & Running the containers in daemon mode
The running of our containers is as simple as running the following command:
```console
docker compose up --build -d
```

## Build the production images and spin up the containers
```console
docker-compose -f docker-compose.prod.yml down -v
docker-compose -f docker-compose.prod.yml up -d --build
docker-compose -f docker-compose.prod.yml exec backend python manage.py migrate --noinput
```
Ensure the app is up and running at http://localhost:1337.
