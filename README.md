Doorsale-demo
=============

Demo site for [Doorsale](http://github.com/mysteryjeans/doorsale) e-commerce solution built on Django. [Doorsale](http://github.com/mysteryjeans/doorsale) has been actively developed, although it is far from ready, this repo gives you chance to contribute in [Doorsale](http://github.com/mysteryjeans/doorsale) project, your feedbacks & contributions will be highly encourge.

**Getting head start in [Doorsale](http://github.com/mysteryjeans/doorsale) development is easy, just clone both repos and restore demo database dump.**

### Setting UP

* Get latest Doorsale app source code

```
$ git clone git@github.com:mysteryjeans/doorsale.git
```

* Get latest Doorsale Demo source code

```
$ git clone git@github.com:mysteryjeans/doorsale-demo.git
```

* You need to include path of Doorsale app in python search paths for packages, so you need to include its path in PYTHONPATH variable or create a simple doorsale.pth file in python site-packages directory, which will contains an actuall path to your doorsale project, example...

```
$ cat /Library/Python/2.7/site-packages/doorsale.pth 
/Users/faraz/Workspace/doorsale
```

* Create PostgreSQL user

```sql
create user doorsale with password 'doorsale';
```

* Create PostgreSQL database

```sql
create database doorsale with owner doorsale;
```
 
* Restore pg_dump.sql from db_dump folder in doorsale-demo project.

```
$ psql -U doorsale doorsale < pg_dump.sql
```

* Run Doorsale demo site

```
$ python manage.py runserver
```

* Go to http://localhost:8000/admin and login using following credentials.
  - user: "mysteryjeans"
  - password: "password"


**This repo is following master branch on [Doorsale](http://github.com/mysteryjeans/doorsale), so you should pull changes frequently to keep things synchronized and running smoothly.**
