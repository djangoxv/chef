etcd_installation 'default' do
  action :create
end

etcd_key "foo" do
  value "a_test_value"
  action :set
end

remote_file '/tmp/foo' do
  source 'http://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem'
  action :nothing
end

http_request 'HEAD http://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem' do
  message ''
  url 'http://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem'
  action :head
  if File.exist?('/tmp/foo')
    headers 'If-Modified-Since' => File.mtime('/tmp/foo').httpdate
  end
  notifies :create, 'remote_file[/tmp/foo]', :immediately
end
