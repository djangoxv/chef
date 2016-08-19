recipe[chef-apt-docker]

docker_installation_package 'default' do
  action :create
  package_options %q|--force-yes -o Dpkg::Options::='--force-all'|
end

docker_service_manager_execute 'default' do
  action :start
end
