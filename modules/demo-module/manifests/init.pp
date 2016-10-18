class demo-module {
    file { 'puppet-demo.txt':
        ensure  => file,
        content => "This was created by Puppet Master version ${serverversion}.",
        path    => '/home/ec2-user/puppet-demo.txt',
    }
    if $operatingsystem == 'CentOS' {
        warning("Your OS is ${operatingsystem}.")
    } else {
        warning("This operating system is ${operatingsystem}.")
    }
}
