class flask{

    package { [ "python2.7", "python2.7-dev","python-pip", "build-essential", "pkg-config", "libssl-dev" ] :
        require => [Package['python-software-properties']],
    }

    exec{ "flask":
        command => "pip install flask flask-sqlalchemy",
        require => Package['python-pip']
    }


    # exec { "make-default-python":
    #     command => "/usr/sbin/update-alternatives --install /usr/bin/python python /usr/bin/python2.7 3",
    #     require => Package["python2.7"],
    #     onlyif => '/usr/bin/test "$(/usr/bin/python -c \'import sys; print sys.version_info[:2]\')" != "(2, 7)"'
    # }
}
