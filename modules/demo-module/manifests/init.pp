class demo-module {
    file { 'puppet-demo.txt':
        ensure  => file,
        content => "This was created by Puppet Master version ${serverversion}.",
        path    => '/home/ec2-user/puppet-demo.txt',
    }
    if $operatingsystem == 'CentOS' {
        notify{"Your OS is ${operatingsystem}.":}
        notice("Your OS is bad.")
        file { 'puppet-demo.csv':
            ensure  => file,
            content => "hit if statement",
            path    => '/home/ec2-user/puppet-demo.csv',
        }
    } else {
        notify{"This operating system is ${operatingsystem}.":}
        notice("Your OS is good.")
        file { 'puppet-demo2.csv':
            ensure  => file,
            content => "hit else statement",
            path    => '/home/ec2-user/puppet-demo2.csv',
        }
    }
}
