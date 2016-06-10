remote_file '/usr/bin/confd' do
  source 'https://github.com/kelseyhightower/confd/releases/download/v0.11.0/confd-0.11.0-linux-amd64'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end

file '/etc/confd/conf.d/foo.toml' do
  content '
[template]
src = "foo.conf.tmpl"
dest = "/tmp/foo"
keys = ["/foo",]'
  mode '0755'
  owner 'root'
  group 'root'
end

file '/etc/confd/templates/foo.conf.tmpl' do
  content '{{getv "/foo"}}'
  mode '0755'
  owner 'root'
  group 'root'
end

execute 'confd_onetime' do
  command '/usr/bin/confd -onetime -backend etcd -node http://127.0.0.1:4001'
end
