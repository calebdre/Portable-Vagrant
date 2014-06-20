# Portable Vagrant Box

Need a development environment you can spin up and use anywhere? Here's one!

### Usage
*Note: Scroll down to see about getting a laravel configuration*  
1. Install [Virtual Box](https://www.virtualbox.org/wiki/Downloads) and [Vagrant](http://www.vagrantup.com/downloads.html)  
2. Make a project directory and `cd` into it  
3. execute `git clone git@github.com:calebdre/Portable-Vagrant.git ./`  
4. execute `vagrant up`  
5. Check out the php info page at *[localhost:5000](http://localhost:5000)*  
6. Start hacking away in the app folder


##### This box includes the following:
#### [PHP 5](http://php.net)
With modules:
- fpm
- cli
- sqlite
- mysql
- mcrypt
- curl

#### [Nginx](http://nginx.org/en/)

#### [Composer](https://getcomposer.org)

#### [Laravel Option](http://laravel.com)
In order to use a laravel configuration, follow these steps:  
1. Edit the `puppet\manifests\init.pp` file  
2. Toward the bottom, fill in the `project` variable with `laravel`  
3. execute `vagrant up`  
4. execute `cd app`  
5. execute `composer create-project laravel/laravel ./`  
6. execute `chmod -R 777 app/storage`  
7. Make something amazing!
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