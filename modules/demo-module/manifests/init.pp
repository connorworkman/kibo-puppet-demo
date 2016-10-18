class demo-module {
    file { 'puppet-demo.txt':
        ensure  => file,
        content => "This was created by Puppet Master version ${serverversion}.",
        path    => '/home/ec2-user/puppet-demo.txt',
    }
    if $operatingsystem == 'Amazon' {
        notify{"Your OS is ${operatingsystem}.":}
        $source = 'puppet:///modules/demo-module/puppet-demo2.csv'
    } else {
        notify{"This operating system is ${operatingsystem}.":}
        notice("Your OS is definitely not Amazon.")
        $source = 'puppet:///modules/demo-module/puppet-demo.csv'
    }
        file { 'puppet-demo.csv':
            ensure  => file,
            path    => '/home/ec2-user/puppet-demo.csv',
            source  => $source,
        }
}
