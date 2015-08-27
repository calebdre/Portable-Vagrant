class wordpress
{
	
	exec{ 'cleanup directory':
		command => "rm -rf /var/www/app/*"
	}
	exec{ 'download wordpress':
			command => "wget -O /var/www/app/wordpress.tar http://wordpress.org/latest",
			require => [Exec["cleanup directory"]]
	}
	
	exec{ 'extract wordpress':
		command => "tar -zxvf /var/www/app/wordpress.tar -C /var/www/app/",
		require =>[Exec['download wordpress']]
	}
	
	exec{'move wordpress install':
		command => "mv -f /var/www/app/wordpress/* /var/www/app/",
		require => [Exec['extract wordpress']]	
	}	
	
	exec{'cleanup wordpress install':
		command => 'rmdir /var/www/app/wordpress',
		require => [Exec['move wordpress install']]
	}
	
	 exec{"create-wp-db-user":
            unless => "/usr/bin/mysql -uroot -p$mysqlPassword database",
            command => "/usr/bin/mysql -uroot -e 
						'create database `worddpress`;
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
