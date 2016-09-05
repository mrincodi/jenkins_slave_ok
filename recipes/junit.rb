#
# Cookbook Name:: jenkins_slave_ok
# Recipe:: junit
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

remote_file '/usr/share/java/junit-4.12.jar' do
  source 'http://search.maven.org/remotecontent?filepath=junit/junit/4.12/junit-4.12.jar'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

remote_file '/usr/share/java/hamcrest-core-1.3.jar' do
  source 'http://search.maven.org/remotecontent?filepath=org/hamcrest/hamcrest-core/1.3/hamcrest-core-1.3.jar'
  owner 'root'
  group 'root'
  mode '0644'
  action :create
end

link '/usr/share/java/junit.jar' do
  to '/usr/share/java/junit-4.12.jar'
  owner 'root'
  group 'root'
  mode '0644'
end
