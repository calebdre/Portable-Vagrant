class php {

	package { ['php5-fpm',
						 'php5-cli']:
	  ensure => present,
	  require => Exec['apt-get update'],
	}

	service { 'php5-fpm':
	  ensure => running,
	  require => Package['php5-fpm'],
	}
}
