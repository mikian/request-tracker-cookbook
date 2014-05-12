#
# Cookbook Name:: request-tracker
# Recipe:: default
#
# Copyright 2014, Bráulio Bhavamitra <braulio@eita.org.br>
#
# GPLv3+
#

default['request-tracker']['server'] = 'nginx'
default['request-tracker']['domain'] = ''

default['request-tracker']['service_name'] = 'request-tracker'
default['request-tracker']['config_path'] = '/etc/request-tracker4'

default['request-tracker']['fcgi_workers'] = 1

default['request-tracker']['name'] = 'Request Tracker'
default['request-tracker']['organization'] = 'Organization'
default['request-tracker']['force_language'] = nil

default['request-tracker']['correspond_address'] = ''
default['request-tracker']['comment_address'] = ''

default['request-tracker']['web_path'] = '/rt'
default['request-tracker']['web_base_url'] = "http://#{node['request-tracker']['domain']}"

# 'mysql', 'Pg', 'SQLite', ...
default['request-tracker']['db_type'] = "mysql"
default['request-tracker']['db_host'] = "localhost"
default['request-tracker']['db_port'] = ""
default['request-tracker']['db_name'] = "rt"
default['request-tracker']['db_user'] = "rtuser"
default['request-tracker']['db_password'] = ""

