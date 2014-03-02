#
# Cookbook Name:: eol-cookbook
# Recipe:: graphite_server
#
# Copyright 2014, Woods Hole Marine Biological Laboratory
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

custom_defaults = data_bag_item('custom_defaults', 'config') rescue {}
graphite_defaults = custom_defaults['graphite'] || {}

node.default['graphite']['timezone'] = 'America/New_York'

node.default['apache']['listen_ports'] = [80, 81]

node.default['graphite']['listen_port'] = 81
node.default['graphite']['carbon']['line_receiver_port'] = graphite_defaults['port'] || 2003

node.default['graphite']['apache']['basic_auth']['user'] = graphite_defaults['dashboard_user']
node.default['graphite']['apache']['basic_auth']['pass'] = graphite_defaults['dashboard_password']
if node.default['graphite']['apache']['basic_auth']['user']
  node.default['graphite']['apache']['basic_auth']['enabled'] = true
end

include_recipe 'graphite'
include_recipe 'statsd'
