Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/" ] }

exec { 'apt-get update':
  command => 'sudo apt-get update',
}

package { 'vim':
  ensure => present,
}

package { "git":
	ensure => installed,
}

package{ "sqlite":
    ensure  => present,
    require => Exec['apt-get update']
}

package { "curl":
	ensure => installed,
}

package{ "python-software-properties":
		ensure => present,
}
file { '/var/www/':
  ensure => 'directory',
}

include nginx, php55, composer, ruby, nodejs
