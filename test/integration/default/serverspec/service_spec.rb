require 'serverspec'

set :backend, :exec

describe service('mesos-dns') do
  it { should be_enabled }
end
