class nodejs{

	# exec { "nodejs":
	# 	command => "apt-get install nodejs",
	# 	#path => "/usr/bin:/usr/sbin:/bin:/usr/local/bin",
	# 	#refreshonly => true,
	# 	require => Exec["node update"],
	# }

	# exec { "node update":
	# 	command => "apt-get update",
	# 	#path => "/usr/bin:/usr/sbin:/bin:/usr/local/bin",
	# 	#refreshonly => true,
	# 	require => Exec['node repo'],
	# }

	# exec { "node repo":
	# 	command => "add-apt-repository ppa:chris-lea/node.js",
	# 	#path => "/usr/bin:/usr/sbin:/bin:/usr/local/bin",
	# 	#refreshonly => true,
	# 	require => Package["python-software-properties"],
	# }

	exec { "npm":
		command => "apt-get install npm -y",
		#path => "/usr/bin:/usr/sbin:/bin:/usr/local/bin",
		#refreshonly => true,
		require => Package['nodejs'],
	}

	exec { "npm modules":
		command => "npm install -g grunt",
		#path => "/usr/bin:/usr/sbin:/bin:/usr/local/bin",
		#refreshonly => true,
		require => Exec['npm'],
	}

	package { "nodejs":
		ensure => installed,
	}
}