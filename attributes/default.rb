default['mesos_dns']['version'] = 'v0.3.0'
default['mesos_dns']['init'] = 'systemd'
default['mesos_dns']['config'] = {
  zk: 'zk://52.8.148.165:2181/mesos',
  masters: [],
  refreshSeconds: 60,
  ttl: 60,
  domain: 'mesos',
  ns: 'ns1',
  port: 8053,
  resolvers: ['8.8.8.8', '8.8.4.4'],
  timeout: 5,
  listener: '0.0.0.0',
  SOAMname: 'root.ns1.mesos',
  SOARname: 'ns1.mesos',
  SOARefresh: 60,
  SOARetry:   600,
  SOAExpire:  86_400,
  SOAMinttl: 60,
  dnson: true,
  httpon: true,
  httpport: 8123,
  externalon: true,
  recurseon: false
}
