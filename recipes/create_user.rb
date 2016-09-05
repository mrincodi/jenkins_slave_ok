#
# Cookbook Name:: jenkins_slave_ok
# Recipe:: create_user
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

# Create user.
user 'worker' do
	# This 'supports' one is needed to create the folder.
	supports :manage_home => true
	action :create
	home  '/home/worker'
	shell '/bin/bash'
end

# Create .ssh and give permissions.
# TODO: Constants?
directory '/home/worker/.ssh' do
	owner 'worker'
	group 'worker'
	mode '0700'
end

# Create authorized_keys and give permissions.
template '/home/worker/.ssh/authorized_keys' do
	source 'authorized_keys.erb'
	owner 'worker'
	group 'worker'
	mode '0600'
end




