docker_installation_package 'default' do
  version '1.12.0-0~trusty'
  action :create
end

service "docker-engine" do
  action :start
end
