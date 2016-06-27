#!/bin/bash

cd && source venv/bin/activate
django-admin startproject p1
cd p1
pip install pysqlite2
python manage.py runserver 0.0.0.0:8000

