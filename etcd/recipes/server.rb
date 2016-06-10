
etcd_installation_binary 'default' do
  action :create
end

etcd_service_manager_systemd 'default' do
  action :start
end

script 'load_etcd' do
  interpreter "bash"
  code <<-EOH
    rds=`curl -s http://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem`
    curl -X PUT http://localhost:2379/v2/keys/foo -d "value=$rds"
    EOH
end

