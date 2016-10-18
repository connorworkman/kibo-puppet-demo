class demomodule {
    file { 'puppet-demo.txt':
        ensure  => file,
        content => 'This was created by Puppet Master version ${serverversion}.',
        path    => '/home/ec2-user/puppet-demo.txt',
    }
}
