require 'serverspec'

set :backend, :exec

describe service('mesos-dns') do
  it { should be_enabled }
end

describe docker_image('mesosphere/mesos-dns:latest') do
  it { should exist }
end

describe file('/etc/mesos-dns-config.json') do
  it { should be_file }
end
