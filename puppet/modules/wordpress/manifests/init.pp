class wordpress
{

	exec{ 'download wordpress':
			command => "wget -O /var/www/app/wordpress.tar http://wordpress.org/latest && 
						tar -zxvf /var/www/app/wordpress.tar -C /var/www/app/ &&
						mv -f /var/www/app/wordpress/* /var/www/app &&
						rmdir /var/www/app/wordpress",
			require => [Package['wget']]
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
