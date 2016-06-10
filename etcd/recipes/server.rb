
etcd_installation_binary 'default' do
  action :create
end

etcd_service_manager_systemd 'default' do
  action :start
end

script 'load_etcd' do
  interpreter "bash"
  code <<-EOH
    rds_bundle=`curl http://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem`
    etcdctl put foo "$rds_bundle"
    EOH
end

