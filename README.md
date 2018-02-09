![Doorstep Demo Screenshot](https://raw.github.com/mysteryjeans/doorstep-demo/master/media/images/demo-screenshot.png)

Doorstep-demo
=============

This is [demo site](http://doorstep-demo.rootplugin.com/) respository for Doorstep e-commerce, that you can clone into your local workstations and tested with prepopulated demo data. [Doorstep](http://github.com/mysteryjeans/doorstep) has been actively developed and this repo gives you chance to contribute in [Doorstep](http://github.com/mysteryjeans/doorstep) project by very quickly getting up & running, we support & encourages an healthy community of contributors - including you!


### Setting UP Demo site

Demo repo have prefilled catalog of products in their respective categories and payments configurations.

* Setup new virtualenv for doorstep and activate

```
$ virtualenv -ppython2.7 ds_env
$ source ds_env/bin/activate
```

Install Doorstep into virtualenv

```
$ pip install --upgrade git+https://github.com/mysteryjeans/doorstep.git#egg=Doorstep
```

Get latest code of demo site

```
$ git clone git@github.com:mysteryjeans/doorstep-demo.git
```

Let's verify your demo site works, change to doorstep-demo directory just have created and run following command.

```
$ python manage.py runserver
```

Go to http://localhost:8000/admin and login using these credentials user: "mysteryjeans" - password: "password"


**This repo is following master branch on [Doorstep](http://github.com/mysteryjeans/doorstep), so you should pull changes frequently to keep things synchronized and running smoothly.** 
