class ruby{

	package { "ruby":
		ensure => installed,
		require => Package['curl'],
	}

	exec { "ruby gems":
		command => "gem install sass compass",
		#path => "/usr/bin:/usr/sbin:/bin:/usr/local/bin",
		#refreshonly => true,
		require => Package['ruby'],
	}
}