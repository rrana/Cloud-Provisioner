* Setup a security group, I’ll call mine “puppets”
* Add a security exception to the puppetmaster that allows access to all instances in the “puppets” group
* Create all puppet instances in the “puppets” security group
* Configure puppet to automatically sign all requests: echo “*” > /etc/puppet/autosign.conf


