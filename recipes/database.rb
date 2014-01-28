#
# Cookbook Name:: eol.org
# Recipe:: database
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

include_recipe 'mysql::server'
include_recipe 'database::mysql'

node.default['mysql']['tunable']['innodb_buffer_pool_size'] = "256M"


def each_database
  %w( eol eol_logging ).each do |db_type|
    database = "#{db_type}_#{node['eol']['environment']}"
    yield database
  end
end

each_database do |db|
  mysql_database db do
    connection ({:username => "root", :password => node['mysql']['server_root_password']})
    action :create
  end
end
