
etcd_installation_binary 'default' do
  action :create
end

etcd_service_manager_systemd 'default' do
  action :start
end

http_request 'rds_bundle' do
  url 'http://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem'
end

etcd_key "/foo" do
  value rds_bundle
  action :set
end

