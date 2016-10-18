COMPLETED:
    Install puppet-server (puppet master on a node)
        yum install puppet-server (RHEL)

    pull puppet config down from git to run changes
        initialize a puppet config repo locally
        now we can manage the puppet config from our workstation

    get the fully qualified hostname:
        curl -L 169.254.169.254/latest/meta-data/hostname

    add the server declaration to puppet.conf
    nodes will use this to contact the puppet master
        server=ip-*-*-*-*.us-west-2.compute.internal (hostname)

    create /etc/puppet/manifests/site.pp and add node declarations
        Example, add host node as a managed node:
            node ip-*-*-*-* {
                include httpd
            }
    add a module to puppet config:
        /etc/puppet/modules/[module-name]/manifests/init.pp
        Declare resources in the puppet DSL much like with chef cookbooks

    start the master of puppets
        service puppetmaster start








