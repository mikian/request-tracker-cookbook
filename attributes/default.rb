
default[:request_tracker][:server] = 'nginx'
default[:request_tracker][:server_name] = node[:fqdn]

default[:request_tracker][:server_port] = case node[:request_tracker][:server]
                                          when 'nginx'
                                            node[:nginx][:listen_ports].first
                                          when 'apache'
                                            node[:apache][:listen_ports].first
                                          end

default[:request_tracker][:service_name] = 'request-tracker'
default[:request_tracker][:config_path] = '/etc/request-tracker4'

default[:request_tracker][:fcgi_workers] = 1

default[:request_tracker][:name] = 'Request Tracker'
default[:request_tracker][:organization] = 'Organization'
default[:request_tracker][:force_language] = nil

default[:request_tracker][:correspond_address] = ''
default[:request_tracker][:comment_address] = ''

default[:request_tracker][:web_path] = '/rt'
default[:request_tracker][:web_base_url] = "http://#{node[:request_tracker][:domain]}"

default[:request_tracker][:mail_gateway] = {}
default[:request_tracker][:mail_gateway][:localhost_only] = false

# 'mysql', 'Pg', 'SQLite', ...
default[:request_tracker][:db_type] = "mysql"
default[:request_tracker][:db_host] = "localhost"
default[:request_tracker][:db_port] = ""
default[:request_tracker][:db_name] = "rt"
default[:request_tracker][:db_user] = "rtuser"
default[:request_tracker][:db_password] = ""

