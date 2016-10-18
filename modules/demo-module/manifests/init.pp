class demo-module {
    file { 'puppet-demo.txt':
        ensure  => file,
        content => "This was created by Puppet Master version ${serverversion}.",
        path    => '/home/ec2-user/puppet-demo.txt',
    }
    file { 'puppet-demo.csv':
    }
    if $operatingsystem == 'CentOS' {
        warning("Your OS is ${operatingsystem}.")
        file { 'puppet-demo.csv':
            ensure  => file,
            content => "hit if statement",
            path    => '/home/ec2-user/puppet-demo.csv/',
        }
    } else {
        warning("This operating system is ${operatingsystem}.")
        file { 'puppet-demo2.csv':
            ensure  => file,
            content => "hit else statement",
            path    => '/home/ec2-user/puppet-demo.csv/',
        }
    }
}
