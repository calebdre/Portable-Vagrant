class nginx {

	# Symlink guest /var/www/app to host /vagrant
	file { '/var/www/app':
	  ensure  => 'link',
	  target  => '/vagrant/app',
	}

	package { 'nginx':
	  ensure => 'present',
	  require => Exec['apt-get update'],
	}

	service { 'nginx':
	  ensure => running,
	  require => Package['nginx'],
	}

	# Add vhost template
	file { 'vagrant-nginx':
	    path => '/etc/nginx/sites-available/127.0.0.1',
	    ensure => file,
	    require => Package['nginx'],
	    source => 'puppet:///modules/nginx/127.0.0.1',
	}

	# Disable default nginx vhost
	file { 'default-nginx-disable':
	    path => '/etc/nginx/sites-enabled/default',
	    ensure => absent,
	    require => Package['nginx'],
	}

	# Symlink our vhost in sites-enabled
	file { 'vagrant-nginx-enable':
	    path => '/etc/nginx/sites-enabled/127.0.0.1',
	    target => '/etc/nginx/sites-available/127.0.0.1',
	    ensure => link,
	    notify => Service['nginx'],
	    require => [
	        File['vagrant-nginx'],
	        File['default-nginx-disable'],
	    ],
	}
}
