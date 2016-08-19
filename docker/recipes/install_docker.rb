include_recipe 'chef-apt-docker'

docker_installation_package 'default' do
  action :create
end

service "docker-engine" do
  action :start
end
