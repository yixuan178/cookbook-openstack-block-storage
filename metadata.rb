# encoding: UTF-8
name             'openstack-block-storage'
maintainer       'AT&T Services, Inc.'
maintainer_email 'cookbooks@lists.tfoundry.com'
license          'Apache 2.0'
description      'The OpenStack Advanced Volume Management service Cinder.'
long_description IO.read(File.join(File.dirname(__FILE__), 'README.md'))
version          '9.2.4'

recipe           'openstack-block-storage::api', 'Installs the cinder-api, sets up the cinder database, and cinder service/user/endpoints in keystone'
recipe           'openstack-block-storage::client', 'Install packages required for cinder client'
recipe           'openstack-block-storage::common', 'Defines the common pieces of repeated code from the other recipes'
recipe           'openstack-block-storage::keystone_registration', 'Registers cinder service/user/endpoints in keystone'
recipe           'openstack-block-storage::scheduler', 'Installs the cinder-scheduler service'
recipe           'openstack-block-storage::volume', 'Installs the cinder-volume service and sets up the iscsi helper'

%w{ ubuntu fedora redhat centos suse }.each do |os|
  supports os
end

depends          'apt', '>= 2.3.8'
depends          'openstack-common', '~> 9.4'
depends          'openstack-identity', '~> 9.0'
depends          'openstack-image', '~> 9.0'
depends          'selinux', '>= 0.7.2'
depends          'python', '>= 1.4.6'
