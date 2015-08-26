Exec { path => [ "/bin/", "/sbin/" , "/usr/bin/", "/usr/sbin/", 'bin/sh' ] }

exec { 'apt-get update':
  command => 'sudo apt-get update',
}

exec { "su":
	command => "sudo su",
	#path => "/usr/bin:/usr/sbin:/bin:/usr/local/bin",
	#refreshonly => true,
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

package { "wget":
	ensure => installed,
}

package{ "python-software-properties":
		ensure => present,
        require => Exec["apt-get update"]
}
file { '/var/www/':
  ensure => 'directory',
}

#############
### Choose a type of project (laravel)
#############
$project = "wordpress"
############
###########
include nginx, mysql# ruby, nodejs

if $project == "php"{
    include php55
    include composer
}

# - Optional Laravel install
if $project == "laravel" {
    include php55
    include composer
    include laravel
}

if $project == "flask"{
    include flask
}

if $project == "wordpress"{
	include php55
	include wordpress
}