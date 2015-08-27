class wordpress
{
	
	exec{ 'cleanup directory':
		command => "rm -rf /var/www/app/*"
	}
	exec{ 'download wordpress':
			command => "wget -O /var/www/app/wordpress.tar http://wordpress.org/latest",
			require => [Exec["cleanup directory"], File['/var/www/app']]
	}
	
	exec{ 'extract wordpress':
		command => "tar -zxvf /var/www/app/wordpress.tar -C /var/www/app/",
		logoutput => true,
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
	
	 exec{"create-wp-db":
            command => "/usr/bin/mysql -uroot -e 'create database `wordpress`;'",
            require => [Exec["create-default-db"]]
    }
	
	exec{"create-wp-db-user":
            command => "/usr/bin/mysql -uroot -e 'create user \"wordpress\"@\"localhost\" identified by \"wordpress\";'",
            require => [Exec["create-wp-db"]]
    }
	
	exec{ "create-wp-db-user-priviledges":
		command => "/usr/bin/mysql -uroot -e 'grant all PRIVILEGES on wordpress.* to \"wordpress\"@\"localhost\";'",
		require => [Exec['create-wp-db-user']]
	}
	
	file{'wp-config.php':
		ensure => file,
		path => '/var/www/app/wp-config.php',
		source => 'puppet:///modules/wordpress/wp-config.php',
		require => [Exec['download wordpress']]	
	}
}
