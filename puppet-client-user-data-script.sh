#!/bin/bash

set -e -x

# Needed so that the aptitude/apt-get operations will not be interactive
export DEBIAN_FRONTEND=noninteractive

apt-get update && apt-get -y upgrade 

# Find the current IP of the puppet master and make "puppet" point to it
puppet_master_ip=$(host puppetmaster.newscred.com | grep "has address" | head -1 | awk '{print $NF}')
echo $puppet_master_ip puppet >> /etc/hosts

aptitude -y install puppet 

# Enable the puppet client
sed -i /etc/default/puppet -e 's/START=no/START=yes/'

service puppet restart