#!/bin/sh

echo "Waiting for collectstatic..."
pwd
cd $HOME
python manage.py collectstatic --no-input --clear

echo "collectstatic done"