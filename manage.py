#!/usr/bin/env python
"""Django's command-line utility for administrative tasks."""
import os

if os.environ.get("JENKINS_HOME"):
    # Jenkins / CI environment → use SQLite
    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.sqlite3',
            'NAME': BASE_DIR / 'db.sqlite3',
        }
    }
else:
    # Production / Local → use MySQL
    DATABASES = {
        'default': {
            'ENGINE': 'django.db.backends.mysql',
            'NAME': os.getenv('DB_NAME', 'your_db_name'),
            'USER': os.getenv('DB_USER', 'your_db_user'),
            'PASSWORD': os.getenv('DB_PASSWORD', 'your_db_password'),
            'HOST': os.getenv('DB_HOST', 'localhost'),
            'PORT': '3306',
        }
    }

