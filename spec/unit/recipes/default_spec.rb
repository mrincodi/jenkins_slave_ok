#
# Cookbook Name:: jenkins_slave_ok
# Spec:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.

require 'spec_helper'

# describe 'jenkins_slave_ok::default' do
#   context 'When all attributes are default, on an unspecified platform' do
#     let(:chef_run) do
#       runner = ChefSpec::ServerRunner.new
#       runner.converge(described_recipe)
#     end
#
#     it 'converges successfully' do
#       expect { chef_run }.to_not raise_error
#     end
#   end
# end

describe 'jenkins_slave_ok::default' do
  let(:chef_run) do
    runner = ChefSpec::ServerRunner.new(platform: 'ubuntu', version: '16.04')
    # ChefSpec::ServerRunner.new
    runner.converge(described_recipe)
  end

  it 'converges successfully' do
    expect { chef_run }.to_not raise_error
  end

  it 'Gets the junit-4.12.jar file' do
    expect(chef_run).to create_remote_file('/usr/share/java/junit-4.12.jar').with(owner: 'root')
  end

  it 'Gets the junit-4.12.jar file' do
    expect(chef_run).to create_remote_file('/usr/share/java/hamcrest-core-1.3.jar').with(owner: 'root')
  end

  it 'Creates the link from junit.jar' do
    expect(chef_run).to create_link('/usr/share/java/junit.jar').with(to: '/usr/share/java/junit-4.12.jar')
  end

  it 'creates a user with the default action' do
    expect(chef_run).to create_user('worker')
  end
end
