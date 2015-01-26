# Portable Vagrant Box

Need a development environment you can spin up and use anywhere? Here's one!

### Usage
*Note: Scroll down to see about getting a laravel configuration*  
1. Install [Virtual Box](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](http://www.vagrantup.com/downloads.html)  
2. Make a project directory and `cd` into it  
3. execute `git clone git@github.com:calebdre/Portable-Vagrant.git ./`
4. choose one of the configurations specified at the bottom
4. execute `vagrant up`  
5. Check out *[localhost:5000](http://localhost:5000)*  
6. Start hacking away in the app folder


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

### [Python/Flask](flask.pocoo.org)  
In order to set up flask, follow these steps:
1. Edit the `$project` variable in the `puppet\manifests\init.pp` file, setting it to `flask`  
2. execute `vagrant up`  
3. ssh into the vagrant box (execute `vagrant ssh`)  
4. execute `python /vagrant/app/app.py` inside the vagrant box  
5. check out [http://localhost:5000](http://localhost:5000)  

#### [Laravel Configuration](http://laravel.com)
In order to use a laravel configuration, follow these steps:    
1. Edit `$project` variable in the `puppet\manifests\init.pp` file, setting it to `laravel`  
2. execute `vagrant up`  
3. execute `cd app`  
4. execute `composer create-project laravel/laravel ./`  
5. execute `chmod -R 777 app/storage`  
6. Check out [http://localhost:5000](http://localhost:5000)  
