class php55
{

	#PHP 5.5 setup

	#https://launchpad.net/~ondrej/+archive/php5
	exec
	{
		'add php55 apt-repo':
			command => '/usr/bin/add-apt-repository ppa:ondrej/php5 -y',
			require => [Package['python-software-properties']],
	}

	exec { "php55 apt update":
		command => 'apt-get update',
	}

	exec { "add php5":
		command => "apt-get install php5 php5-cli php5-fpm php5-mysql php5-sqlite php5-mcrypt php5-curl -y",
		#path => "/usr/bin:/usr/sbin:/bin:/usr/local/bin",
		#refreshonly => true,
		require => [Exec["php55 apt update"], Exec['su']]
	}
}