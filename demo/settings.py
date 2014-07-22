"""
Django settings for demo project.

For more information on this file, see
https://docs.djangoproject.com/en/1.6/topics/settings/

For the full list of settings and their values, see
https://docs.djangoproject.com/en/1.6/ref/settings/
"""

# Build paths inside the project like this: os.path.join(BASE_DIR, ...)
import socket
import os.path

DEV_MACS = ('Dev-Mac', 'Envy15', 'envy', 'trg-tech-farazm', 'faraz-VirtualBox', 'trg-tech-faraz', 'macbook-pro')


DEBUG = socket.gethostname() in DEV_MACS
TEMPLATE_DEBUG = DEBUG

BASE_DIR = os.path.dirname(os.path.dirname(__file__))


# Quick-start development settings - unsuitable for production
# See https://docs.djangoproject.com/en/1.6/howto/deployment/checklist/

# SECURITY WARNING: keep the secret key used in production secret!
SECRET_KEY = 'doorsale_demo_test_settings_key'

# SECURITY WARNING: don't run with debug turned on in production!
DEBUG = True

TEMPLATE_DEBUG = True

ALLOWED_HOSTS = []


# Application definition

INSTALLED_APPS = (
    'django.contrib.admin',
    'django.contrib.auth',
    'django.contrib.contenttypes',
    'django.contrib.sessions',
    'django.contrib.messages',
    'django.contrib.staticfiles',
    'pipeline',
)

MIDDLEWARE_CLASSES = (
    'django.contrib.sessions.middleware.SessionMiddleware',
    'django.middleware.common.CommonMiddleware',
    'django.middleware.csrf.CsrfViewMiddleware',
    'django.contrib.auth.middleware.AuthenticationMiddleware',
    'django.contrib.messages.middleware.MessageMiddleware',
    'django.middleware.clickjacking.XFrameOptionsMiddleware',
)

ROOT_URLCONF = 'demo.urls'

WSGI_APPLICATION = 'demo.wsgi.application'


# Database
# https://docs.djangoproject.com/en/1.6/ref/settings/#databases

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.postgresql_psycopg2', # Add 'postgresql_psycopg2', 'mysql', 'sqlite3' or 'oracle'.
        'NAME': 'doorsale',                      # Or path to database file if using sqlite3.
        'USER': 'doorsale',                      # Not used with sqlite3.
        'PASSWORD': 'doorsale',                  # Not used with sqlite3.
        'HOST': '',                      # Set to empty string for localhost. Not used with sqlite3.
        'PORT': '',                      # Set to empty string for default. Not used with sqlite3.
    }
}

# Internationalization
# https://docs.djangoproject.com/en/1.6/topics/i18n/

LANGUAGE_CODE = 'en-us'

TIME_ZONE = 'UTC'

USE_I18N = True

USE_L10N = True

USE_TZ = True


# Static files (CSS, JavaScript, Images)
# https://docs.djangoproject.com/en/1.6/howto/static-files/

STATIC_URL = '/static/'

STATIC_ROOT = os.path.join(BASE_DIR, 'static')

MEDIA_URL = '/media/'

MEDIA_ROOT = os.path.join(BASE_DIR, 'media')

# Doorsale settings
# https://github.com/mysteryjeans/doorsale
import doorsale.settings


# Authentication model settings
AUTH_USER_MODEL = doorsale.settings.AUTH_USER_MODEL
LOGIN_URL = doorsale.settings.LOGIN_URL
LOGIN_REDIRECT_URL = doorsale.settings.LOGIN_REDIRECT_URL


SUPPORT_EMAIL = 'demo@doorsaledemo.com'

# Including doorsale apps
INSTALLED_APPS += doorsale.settings.DOORSALE_APPS

PIPELINE_CSS =  doorsale.settings.PIPELINE_CSS

PIPELINE_JS =  doorsale.settings.PIPELINE_JS

PIPELINE_COMPILERS = doorsale.settings.PIPELINE_COMPILERS

STATICFILES_STORAGE = doorsale.settings.STATICFILES_STORAGE

PIPELINE_DISABLE_WRAPPER = doorsale.settings.PIPELINE_DISABLE_WRAPPER

DOMAIN = '127.0.0.1:8000'
SITE_NAME = 'Doorsale Demo'
SITE_TITLE = 'The powerful e-commerce solution for Django'
SITE_DESCRIPTION = 'The e-commerce solution demo site build using Doorsale'
COPYRIGHT = 'Doorsale (c) 2014'
CONTACT_EMAIL = 'demo@doorsaledemo.com'

# Email server settings
# EMAIL_HOST = ''
# EMAIL_PORT = 587
# EMAIL_USE_TLS = True
# EMAIL_HOST_USER = ''
# EMAIL_HOST_PASSWORD = ''


