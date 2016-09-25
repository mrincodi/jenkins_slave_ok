#
# Cookbook Name:: jenkins_slave_ok
# Recipe:: create_user
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# Create group for user.
group node['groupname']

# Create user.
user node['username'] do
  # This 'supports' one is needed to create the folder.
  # supports :manage_home => true
  supports manage_home: true
  action :create
  group node['groupname']
  home  node['homedir']
  shell node['shell']
end

# Create .ssh and give permissions.
# TODO: Constants?
directory '/home/worker/.ssh' do
  owner node['username']
  group node['groupname']
  mode '0700'
end

# Create authorized_keys and give permissions.
template '/home/worker/.ssh/authorized_keys' do
  source 'authorized_keys.erb'
  owner node['username']
  group node['groupname']
  mode '0600'
end
