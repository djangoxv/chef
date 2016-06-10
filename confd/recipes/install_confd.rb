remote_file '/usr/bin/confd' do
  source 'https://github.com/kelseyhightower/confd/releases/download/v0.11.0/confd-0.11.0-linux-amd64'
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
