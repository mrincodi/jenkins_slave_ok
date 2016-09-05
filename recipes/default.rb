include_recipe 'apt::default'
include_recipe 'git::default'
include_recipe 'java_se::default'

include_recipe 'jenkins_slave_ok::junit'

include_recipe 'jenkins_slave_ok::create_user'

#include_recipe 'jenkins_slave_ok::git'

