class nginx {

	package { 'nginx':
	  ensure => 'present',
	  require => Exec['apt-get update'],
	}

	service { 'nginx':
	  ensure => running,
	  require => Package['nginx'],
	}

	# Add vhost template
	if $project == "php" {
		file { 'vagrant-nginx':
		    path => '/etc/nginx/sites-available/localhost',
		    ensure => file,
		    require => Package['nginx'],
		    source => 'puppet:///modules/nginx/localhost',
		}
	}

	if $project == "flask"{
		file { 'vagrant-nginx':
			path => '/etc/nginx/sites-available/localhost',
			ensure => file,
			require => Package['nginx'],
			source => 'puppet:///modules/nginx/flask'
		}
	}
	
	if $project == "wordpress"{
		file { 'vagrant-nginx':
			path => '/etc/nginx/sites-available/localhost',
			ensure => file,
			require => Package['nginx'],
			source => 'puppet:///modules/nginx/wordpress'
		}
	}


	# Disable default nginx vhost
	file { 'default-nginx-disable':
	    path => '/etc/nginx/sites-enabled/default',
	    ensure => absent,
	    require => Package['nginx'],
	}

	# Symlink our vhost in sites-enabled
	file { 'vagrant-nginx-enable':
	    path => '/etc/nginx/sites-enabled/localhost',
	    target => '/etc/nginx/sites-available/localhost',
	    ensure => link,
	    notify => Service['nginx'],
	    require => [
	        File['default-nginx-disable'],
	    ],
	}
}
