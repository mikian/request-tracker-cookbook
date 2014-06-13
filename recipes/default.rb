
server = node[:request_tracker][:server]
if server == 'apache'
  case node[:platform_family]
    when "debian", "ubuntu"
      packages = %w[rt4-apache2]
    end
elsif server == 'nginx'
  case node[:platform_family]
    when "debian", "ubuntu"
      packages = %w[rt4-fgci]
    end
end

packages.each do |p|
  package p
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
  template "#{node[:nginx][:dir]}/sites-enabled/#{node[:request_tracker][:service_name]}" do
    source "nginx.conf.erb"
    variables node[:request_tracker]

    notifies :reload, "service[nginx]"
    action :create
  end
elsif node[:request_tracker][:proxy_server] == 'apache'
  web_app node[:request_tracker][:service_name] do
    enable true

    server_name node[:request_tracker][:domain]
  end
  notifies :reload, "service[apache2]"
end

