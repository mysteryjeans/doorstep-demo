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
    #'grappelli',
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

# DATABASES = {
#     'default': {
#         'ENGINE': 'django.db.backends.postgresql_psycopg2', # Add 'postgresql_psycopg2', 'mysql', 'sqlite3' or 'oracle'.
#         'NAME': 'doorsale2',                      # Or path to database file if using sqlite3.
#         'USER': 'doorsale2',                      # Not used with sqlite3.
#         'PASSWORD': 'doorsale2',                  # Not used with sqlite3.
#         'HOST': '',                      # Set to empty string for localhost. Not used with sqlite3.
#         'PORT': '',                      # Set to empty string for default. Not used with sqlite3.
#     }
# }

DATABASES = {
    'default': {
        'ENGINE': 'django.db.backends.sqlite3',
        'NAME': os.path.join(BASE_DIR, 'db.sqlite3'),
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

FIXTURE_DIRS = (
    os.path.join(BASE_DIR, 'fixtures'),
)


from django.conf.global_settings import TEMPLATE_CONTEXT_PROCESSORS

TEMPLATE_CONTEXT_PROCESSORS += (
    "django.core.context_processors.request",
    )


################## Doorsale #########################
#####################################################

# Doorsale e-commerce settings for Django project
# Customize these settings only if you know

# Django authentication app extended by Doorsale in Django way
# To implement your own custom auth user model, extend
# doorsale.accounts.AbstractUser instead and change AUTH_USER_MODEL
# similarly. Doorsale will adopt new AUTH_USER_MODEL seemlessly
AUTH_USER_MODEL = 'accounts.User'
LOGIN_URL = '/accounts/login/'
LOGIN_REDIRECT_URL = '/'

# Doorsale apps configuration required for Django
INSTALLED_APPS += (
    'doorsale',
    'doorsale.geo',
    'doorsale.pages',
    'doorsale.accounts',
    'doorsale.catalog',
    'doorsale.sales',
    'doorsale.financial',
    'doorsale.payments',
)

# DOMAIN will be used in link generation specially in emails
DOMAIN = '127.0.0.1:8000'

# SITE_NAME it will be used in all pages, this is the name of your website
SITE_NAME = 'Doorsale'

# SITE_TITLE for index pages of your website
SITE_TITLE = 'The powerful e-commerce solution for Django'

# Meta description for SEO
SITE_DESCRIPTION = 'The e-commerce solution site build using Doorsale'

# COPYRIGHT statement for all pages
COPYRIGHT = 'Copyright &copy; 2014 Doorsale. All rights reserved.'

# SUPPORT_EMAIL address for bugs and error reporting
SUPPORT_EMAIL = 'demo@doorsaledemo.com'


################ Django-Pipeline #####################
######################################################

# Doorsale uses django-pipeline for LESS & Javascript
# preprocessing, compression and versioning.

# When collectstatic called during deployment LESS & Javascript will be
# compiled, compressed and versioned before copying to static folder

# Django-Pipeline app required by Doorsale
INSTALLED_APPS += ('pipeline',)

# LESS compiler configuration for django-pipeline
PIPELINE_COMPILERS = ('pipeline.compilers.less.LessCompiler',)

# LESS & Javascript static files serving in development
STATICFILES_STORAGE = 'pipeline.storage.PipelineCachedStorage'

# Custom Javascript needs to be in global scope
# in order for Doorsale to work properly
PIPELINE_DISABLE_WRAPPER = True

# LESS compiler search paths for resources
# Always use relative paths in @import statements in LESS
# All resources in app's static directory will be available
# for LESS compiler
from doorsale.utils.finders import get_static_paths
STATIC_PATHS = os.pathsep.join(get_static_paths(INSTALLED_APPS))
PIPELINE_LESS_ARGUMENTS = '--include-path=%s' % STATIC_PATHS

# CSS configurations for django-pipeline
# All LESS styles configured for doorsale defined
# You can append your LESS configurations here.
PIPELINE_CSS = {
    # doorsale app LESS styles
    'base': {
        'source_filenames': (
            'doorsale/css/base.less',
        ),
        'output_filename': 'doorsale/css/base.css'
    },
    # doorsale.catalog LESS styles for products catalog
    'catalog': {
        'source_filenames': (
            'catalog/css/catalog.less',
        ),
        'output_filename': 'catalog/css/catalog.css'
    },
    # Font-Awesome icons serve mostly
    'font-awesome': {
        'source_filenames': (
            'catalog/css/font-awesome/css/font-awesome.min.css',
        ),
        'output_filename': 'catalog/css/font-awesome/css/font-awesome.min.css'
    },
    # doorsale.sales LESS styles for checkout pages
    'sales': {
        'source_filenames': (
            'sales/css/sales.less',
        ),
        'output_filename': 'sales/css/sales.css'
    },
    # doorsale.pages LESS styles for flat pages
    'pages': {
        'source_filenames': (
            'pages/css/pages.less',
        ),
        'output_filename': 'pages/css/pages.css'
    }
}


# Javascript configuration for django-pipeline
# Doorsale app's Javascript compressed & versioned before deployment
# Simply add your project or apps Javascript here
PIPELINE_JS = {
    # doorsale: Base javascript include in every page
    'base': {
        'source_filenames': (
            'doorsale/scripts/jquery-ajax.js',
            'doorsale/scripts/jquery-utils.js',
        ),
        'output_filename': 'doorsale/scripts/base.js',
    },
    # doorsale.catalog: Javascript for product catalog pages
    'catalog_base': {
        'source_filenames': (
            'catalog/scripts/jquery.catalog_base.js',
        ),
        'output_filename': 'catalog/scripts/catalog_base.js',
    },
    'search_products': {
        'source_filenames': (
            'catalog/scripts/jquery.search_products.js',
        ),
        'output_filename': 'catalog/scripts/search_products.js',
    },
    'product_detail': {
        'source_filenames': (
            'catalog/scripts/jquery.scrollTo.js',
            'catalog/scripts/jquery.serialScroll.js',
            'catalog/scripts/jquery.elevatezoom.js',
            'catalog/scripts/jquery.product_detail.js',
        ),
        'output_filename': 'catalog/scripts/product_detail.js',
    },
    'sales_checkout_order': {
        'source_filenames': (
            'sales/scripts/jquery.creditCardValidator.js',
            'sales/scripts/jquery.maskedinput.js',
            'sales/scripts/jquery.checkout_order.js',
        ),
        'output_filename': 'sales/scripts/sales_checkout_order.js',
    }
}


# You should define your email server settings here  
EMAIL_HOST = 'smtp.mailgun.org'
EMAIL_PORT = 587
EMAIL_USE_TLS = True
EMAIL_HOST_USER = 'postmaster@sandbox46644.mailgun.org'
EMAIL_HOST_PASSWORD = r'47dne5%*B%$%GVF*52B'


