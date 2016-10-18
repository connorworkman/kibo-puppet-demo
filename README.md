Open Source Puppet:
    Allow inbound connections on port 8140 for the puppet master.

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
                include [class-name]
            }
    add a module to puppet config:
        /etc/puppet/modules/[class-name]/manifests/init.pp
        Declare resources in the puppet DSL much like with chef cookbooks
        ex:
        class apache2 {
            package {
                "httpd": ensure => running,
            }
        }

    [re]start the master of puppets
        service puppetmaster [re]start

    launch another instance to act as a node
    install puppet agent
        sudo yum install puppet
    
    set the server variable in puppet.conf
        server=[fully-qualified-hostname-of-puppet-master]
    
    attempt to connect to the puppet master
        sudo puppet agent -t

    this will create a certificate request on the puppet master
    now we need to sign the request from the master

    from master:
        sudo puppet cert list # this will show you any certificates waiting to be signed
        sudo puppet cert sign [fully-qualified-hostname-of-node] # now the agent will be able to connect and request the catalog
    results in:
        notice: Signed certificate request for ip-172-31-21-43.us-west-2.compute.internal
        notice: Removing file Puppet::SSL::CertificateRequest ip-172-31-21-43.us-west-2.compute.internal at '/var/lib/puppet/ssl/ca/requests/ip-172-31-21-43.us-west-2.compute.internal.pem'

    issue an agent test from the new puppet node

    add the node to the site.pp manifest and give it a runlist
        in site.pp:
            node [node-hostname] {
                include apache2
                include demoModule
            }
