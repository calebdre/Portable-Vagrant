Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/", 'bin/sh' ] }

exec { 'apt-get update':
  command => 'sudo apt-get update',
}

package { 'vim':
  ensure => present,
}

package { "git":
	ensure => installed,
}

package{ "sqlite3":
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

$project = ""

include nginx, php55, composer, ruby, nodejs

# - Optional Laravel install
if $project == "laravel" {
	include laravel
}