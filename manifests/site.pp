#Puppet master (this node)
node ip-172-31-20-160 {
    include apache2
    include demo-module
}

node ip-172-31-21-43 {
    include apache2
    include demo-module
}
