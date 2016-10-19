class demo-module {
    file { 'puppet-demo.txt':
        ensure  => file,
        content => "This was created by Puppet Master version ${serverversion}.",
        path    => '/home/ec2-user/puppet-demo.txt',
    }
    if $operatingsystem == 'Amazon' {
        notify{"Your OS is ${operatingsystem}.":}
        $source = 'puppet:///modules/demo-module/puppet-demo2.csv'
        $username = 'ec2-user'
    } elsif $operatingsystem == 'Red Hat Enterprise Linux Server' {
        notify{"Your OS is RHEL.":}
        $source = 'puppet:///modules/demo-module/puppet-demo2.csv'
        $username = 'ec2-user'
    } else {
        notify{"This operating system is ${operatingsystem}.":}
        notice("Your OS is definitely not Amazon.")
        $source = 'puppet:///modules/demo-module/puppet-demo.csv'
        $username = 'user'
    }
    file { 'puppet-demo.csv':
        ensure  => file,
        path    => "/home/${username}/puppet-demo.csv",
        source  => $source,
    }
}
