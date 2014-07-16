![Doorsale Demo Screenshot](https://raw.github.com/mysteryjeans/doorsale-demo/master/media/images/demo-screenshot.png)

Doorsale-demo
=============

[Demo site](http://doorsale-demo.fanaticlab.com/) for [Doorsale](http://github.com/mysteryjeans/doorsale) e-commerce solution built on Django. [Doorsale](http://github.com/mysteryjeans/doorsale) has been actively developed, although it is far from ready, this repo gives you chance to contribute in [Doorsale](http://github.com/mysteryjeans/doorsale) project, your feedbacks & contributions will be highly encourge.

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

* You need to include path of Doorsale app in python search paths for packages, so include doorsale cloned repo in PYTHONPATH variable or simply create a doorsale.pth file in python site-packages directory having an actuall path of the project repo, e.g...

```
$ cat /Library/Python/2.7/site-packages/doorsale.pth 
/Users/faraz/Workspace/doorsale
```

* If you want to install Doorsale app using pip, go to repository and run.

```
$ pip install --upgrade .
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
