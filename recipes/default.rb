package_options = ''

case node[:platform_family]
when "debian", "ubuntu"
if node[:request_tracker][:install_from] == 'debian_testing'
  package_options = '-t testing'

  apt_repository 'debian_testing' do
    uri 'http://ftp.debian.org/debian'
    distribution "testing"
    components ['main']
    keyserver 'keyserver.ubuntu.com'
    key '8B48AD6246925553'
  end

  apt_preference 'debian_testing' do
    glob '*'
    pin 'release a=testing'
    # 200 was chosen based on http://stackoverflow.com/questions/512906/debian-how-can-i-pull-a-single-package-with-dependencies-from-another-repositor
    pin_priority '200'
  end
end
end

server = node[:request_tracker][:server]
if server == 'apache'
  case node[:platform_family]
  when "debian", "ubuntu"
    packages = %w[rt4-apache2]
  end
elsif server == 'nginx'
  case node[:platform_family]
  when "debian", "ubuntu"
    packages = %w[rt4-fcgi]
  end
end

packages.each do |p|
  package p do
    options package_options
  end
end

fcgi = if server == 'nginx' then true elsif server == 'apache' then false end
service 'rt4-fcgi' do
  init_command "/etc/init.d/rt4-fcgi"
  action (if fcgi then :enable else :disable end)
end

template "/etc/default/rt4-fcgi" do
  variables({
    :fcgi => (if fcgi then 1 else 0 end),
    :workers => node[:request_tracker][:fcgi_workers],
  })
  notifies :restart, "service[rt4-fcgi]"
end

template "#{node[:request_tracker][:config_path]}/RT_SiteConfig.pm" do
  mode "640"
  variables node[:request_tracker]
  notifies :restart, "service[rt4-fcgi]"
end

if server == 'nginx'
  include_recipe 'nginx'

  template "#{node[:nginx][:dir]}/sites-available/#{node[:request_tracker][:service_name]}" do
    source "nginx.conf.erb"
    owner node[:nginx][:user]
    group node[:nginx][:group]
    variables node[:request_tracker]
  end

  nginx_site node[:request_tracker][:service_name] do
    enable true
  end
elsif server == 'apache'
  include_recipe 'apache2'

  template "#{node[:apache][:dir]}/sites-available/#{node[:request_tracker][:service_name]}.conf" do
    source "apache2.conf.erb"
    owner node[:apache][:user]
    group node[:apache][:group]
    variables node[:request_tracker]
  end
  link "#{node[:apache][:dir]}/sites-available/#{node[:request_tracker][:service_name]}" do
    to "#{node[:apache][:dir]}/sites-available/#{node[:request_tracker][:service_name]}.conf"
  end
  apache_site node[:request_tracker][:service_name] do
    enable true
  end
end

