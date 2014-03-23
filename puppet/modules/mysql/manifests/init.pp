class mysql {

	package { ['mysql-server']:
    ensure => present,
	  require => Exec['apt-get update'],
  }

  service { 'mysql':
    ensure  => running,
    require => Package['mysql-server'],
  }

  file { '/etc/mysql/my.cnf':
    source  => 'puppet:///modules/mysql/my.cnf',
    require => Package['mysql-server'],
    notify  => Service['mysql'],
  }

  exec { 'set-mysql-password':
    unless  => 'mysqladmin -uroot -proot status',
    command => 'mysqladmin -uroot password a9120ed2b58af37862a83f5b9f850819ed08b2a9',
    path    => ['/bin', '/usr/bin'],
    require => Service['mysql'];
  }
}
