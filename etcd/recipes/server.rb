
etcd_installation 'default' do
  action :create
end

etcd_service_manager_upstart 'default' do
  action :start
end

etcd_key "foo" do
  value "a_test_value"
  action :set
end

