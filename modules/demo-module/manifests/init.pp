class demo-module {
    #switch this if to case statement and continue on with linuxacademy tutorials
    user { 'kibo-dev':
        ensure      => present,
        home        => '/home/kibo-user',
        gid         => 'dev',
        shell       => '/bin/bash',
        managehome  => true,
    }
    user { 'kibo-admin':
        ensure      => present,
        managehome  => false,
        gid         => ['wheel','dev'],
        shell       => '/bin/bash',
    }
    if $operatingsystem == 'Amazon' {
        notify{"Your OS is ${operatingsystem}.":}
        $source = 'puppet:///modules/demo-module/puppet-demo2.csv'
    } elsif $operatingsystem == 'RedHat' {
        notify{"Your OS is RHEL.":}
        $source = 'puppet:///modules/demo-module/puppet-demo2.csv'
    } else {
        notify{"This operating system is ${operatingsystem}.":}
        notice("Your OS is definitely not Amazon.")
        $source = 'puppet:///modules/demo-module/puppet-demo.csv'
    }
    file { 'puppet-demo.csv':
        ensure      => file,
        path        => "/home/kibo-user/puppet-demo.csv",
        source      => $source,
    }
    file { 'puppet-demo.txt':
        ensure      => file,
        content     => "This was created by Puppet Master version ${serverversion}.",
        path        => '/home/kibo-user/puppet-demo.txt',
    }
}
