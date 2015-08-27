# Portable Vagrant Box

Need a way to set up a development environment really easily? Here's one!

### Usage  
1. Install [Virtual Box](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](http://www.vagrantup.com/downloads.html)  
2. Make a project directory and `cd` into it  
3. execute `git clone git@github.com:calebdre/Portable-Vagrant.git ./`  
4. choose one of the configurations specified at the bottom  
5. execute `vagrant up`  
6. Check out *[localhost:5000](http://localhost:5000)*  
7. Start hacking away in the app folder  

##### This box includes the following:

#### [Nginx](http://nginx.org/en/)

#### [Composer](https://getcomposer.org)

#### [NodeJs](https://getcomposer.org/)
With npm modules:
- [Grunt](http://gruntjs.com)

#### [Ruby (1.9.3p484)](https://www.ruby-lang.org/en/)
With gems:
- [Sass](http://sass-lang.com)
- [Compass](http://compass-style.org/)

#### [MySql](http://www.mysql.com/)
user: root  
password: ""  
database name: database  


#### [PHP 5](http://php.net)  
In order to set up PHP, follow these steps:  
1. Edit the `$project` variable in the `puppet\manifests\init.pp` file, setting it to `php`  
2. run `vagrant up`  
3. check out [http://localhost:5000](http://localhost:5000)  

### [Wordpress Configuration](http://wordpress.org)
In order to have a wordpress environment, follow these steps:  
1. Edit `$project` variable in the `puppet\manifests\init.pp` file, setting it to `wordpress`  
2. execute `vagrant up`  
3. Check out [http://localhost:5000](http://localhost:5000) 
4. Enter a site title, username, and password  
5. Start making wordpress themes!  

#### [Laravel Configuration](http://laravel.com)
In order to use a laravel environment, follow these steps:    
1. Edit `$project` variable in the `puppet\manifests\init.pp` file, setting it to `laravel`  
2. execute `vagrant up`  
3. execute `cd app`  
4. execute `composer create-project laravel/laravel ./`  
5. execute `chmod -R 777 app/storage`  
6. Check out [http://localhost:5000](http://localhost:5000)  

### [Python/Flask](flask.pocoo.org)  
In order to set up flask, follow these steps:  
1. Edit the `$project` variable in the `puppet\manifests\init.pp` file, setting it to `flask`  
2. execute `vagrant up`  
3. ssh into the vagrant box (execute `vagrant ssh`)  
4. execute `python /vagrant/app/app.py` inside the vagrant box  
5. check out [http://localhost:5000](http://localhost:5000)  
