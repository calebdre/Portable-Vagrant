class mysql
{
    $mysqlPassword = ""

    package
    {
        "mysql-server":
            ensure  => present,
            require => Exec['apt-get update']
    }

    service
    {
        "mysql":
            enable => true,
            ensure => running,
            require => Package["mysql-server"],
    }

    # Make sure that any previously setup boxes are gracefully
    # transitioned to the new empty root password.
    exec
    {
    	"set-mysql-password":
            onlyif => "mysqladmin -uroot -proot status",
            command => "mysqladmin -uroot -proot password $mysqlPassword",
            require => Service["mysql"],
    }

    exec
    {
        "create-default-db":
            unless => "/usr/bin/mysql -uroot -p$mysqlPassword database",
            command => "/usr/bin/mysql -uroot -p$mysqlPassword -e 'create database `database`;'",
            require => [Service["mysql"], Exec["set-mysql-password"]]
    }
	
	file { "my.cnf":
		ensure => file,
		path => "/etc/mysql/my.cnf",
		source => "puppet:///modules/mysql/my.cnf",
		mode    => 600,
		owner   => "root",
		group   => "root",
		require => Service["mysql"]
	}
	
	exec{
		"restart mysql":
		command => "service mysql restart",
		require => File["my.cnf"]
	}
	
	exec{
		"update user for host":
		command => "/usr/bin/mysql -uroot -e 'update mysql.user set host = \"%\" where mysql.user.Host = \"localhost\"; FLUSH PRIVILEGES;'",
		require => File["my.cnf"]
	}
}