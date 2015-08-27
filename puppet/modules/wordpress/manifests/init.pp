class wordpress
{

	exec{ 'download wordpress':
			command => "rm -rf /var/www/app/* &&
						git clone https://github.com/WordPress/WordPress.git /var/www/app/",
			require => [Package['git']]
	}
	
	 exec{"create-wp-db-user":
            unless => "/usr/bin/mysql -uroot -p$mysqlPassword database",
            command => "/usr/bin/mysql -uroot -p$mysqlPassword -e 
						'create database `database`;
						 create user wordpress;
						 grant all on wordpress.* to `wordpress`@`localhost` identified by `wordpress`;
						 '",
            require => [Exec["create-default-db"]]
    }
	
	file{'wp-config.php':
		ensure => file,
		path => '/var/www/app/wp-config.php',
		source => 'puppet:///modules/wordpress/wp-config.php',
		require => [Exec['download wordpress']]	
	}
}
