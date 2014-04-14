Doorsale-demo
=============

Demo site for Doorsale e-commerce solution built on Django. Doorsale is been active developed, although it is far from ready, this repos gives you chance to leaves your finger prints in the making of this project, your feedback and contribution will be highly encourge.

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

* Go to http://localhost:8000/admin and login with user: "mysteryjeans" and password: "password".
