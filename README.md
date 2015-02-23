![Doorsale Demo Screenshot](https://raw.github.com/mysteryjeans/doorsale-demo/master/media/images/demo-screenshot.png)

Doorsale-demo
=============

This is [demo site](http://doorsale-demo.rootplugin.com/) respository for Doorsale e-commerce, that you can clone into your local workstations and tested with prepopulated demo data. [Doorsale](http://github.com/mysteryjeans/doorsale) has been actively developed and this repo gives you chance to contribute in [Doorsale](http://github.com/mysteryjeans/doorsale) project by very quickly getting up & running, we support & encourages an healthy community of contributors - including you!


### Setting UP Demo site

Demo repo have prefilled catalog of products in their respective categories and payments configurations.

* Setup new virtualenv for doorsale and activate

```
$ virtualenv -ppython2.7 ds_env
$ source ds_env/bin/activate
```

Install Doorsale into virtualenv

```
$ pip install --upgrade git+https://github.com/mysteryjeans/doorsale.git#egg=Doorsale
```

Get latest code of demo site

```
$ git clone git@github.com:mysteryjeans/doorsale-demo.git
```

Let's verify your demo site works, change to doorsale-demo directory just have created and run following command.

```
$ python manage.py runserver
```

Go to http://localhost:8000/admin and login using these credentials user: "mysteryjeans" - password: "password"


**This repo is following master branch on [Doorsale](http://github.com/mysteryjeans/doorsale), so you should pull changes frequently to keep things synchronized and running smoothly.** 
