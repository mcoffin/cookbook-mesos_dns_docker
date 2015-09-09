require 'chefspec'
require 'chefspec/berkshelf'

describe 'mesos_dns_docker::default' do
  let(:chef_run) { ChefSpec::SoloRunner.converge(described_recipe) }

  it 'creates service[mesos-dns]' do
    expect(chef_run).to enable_service('mesos-dns')
  end

  it 'creates file[/etc/mesos-dns-config.json]' do
    expect(chef_run).to create_file('/etc/mesos-dns-config.json')
  end
end
