#
# Cookbook Name:: mesos_dns_docker
# Recipe:: default
#
# Copyright 2015, Matt Coffin
#
require 'json'

docker_service 'default' do
  action [:create, :start]
end

docker_image 'mesosphere/mesos-dns' do
  tag node['mesos_dns']['version']
  action :pull
  notifies :restart, 'service[mesos-dns]', :delayed
end

file '/etc/mesos-dns-config.json' do
  content node['mesos_dns']['config'].to_json
  owner 'root'
  group 'root'
  mode '0755'
  notifies :restart, 'service[mesos-dns]', :delayed
end

execute 'systemctl daemon-reload' do
  command 'systemctl daemon-reload'
  action :nothing
end

case node['mesos_dns']['init']
when 'systemd'
  template '/etc/systemd/system/mesos-dns.service' do
    source 'systemd.erb'
    owner 'root'
    group 'root'
    mode '0755'
    variables(
      image: "mesosphere/mesos-dns:#{node['mesos_dns']['version']}"
    )
    notifies :run, 'execute[systemctl daemon-reload]', :immediately
  end
  service 'mesos-dns' do
    action :enable
  end
end
