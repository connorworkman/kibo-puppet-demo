COMPLETED:
    Install puppet-server (puppet master on a node)
        yum install puppet-server (RHEL)
    pull puppet config down from git to run changes
        initialize a puppet config repo locally
        now we can manage the puppet config from our workstation
    add the server declaration to puppet.conf
        server=ip-10-*-*-**.us-west-2.compute.internal (hostname)
    create /etc/puppet/manifests/site.pp and add node declarations
        Example, add host node as a managed node:
            node ip-10-*-*-** {
                include httpd
            }
    add a module to puppet config:
        /etc/puppet/modules/[module-name]/manifests/init.pp
        Declare resources in the puppet DSL much like with chef cookbooks









