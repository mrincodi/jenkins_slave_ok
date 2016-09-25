describe package 'git' do
  it { should be_installed }
end

describe command('java -version') do
 its('stderr') { should match (/1.8/) }
end

describe command('javac -version') do
 its('stderr') { should match (/1.8/) }
end

describe file '/usr/share/java/junit-4.12.jar' do
  it { should exist }
  its('owner') { should eq 'root' }
  its('group') { should eq 'root' }
  its('mode') { should cmp '0644' }
  its('md5sum') { should eq '5b38c40c97fbd0adee29f91e60405584' }
end
