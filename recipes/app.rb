#
# Cookbook Name:: eol.org
# Recipe:: app
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

# deployment user
include_recipe 'users'

users_manage "eol_development_deploy" do
  action :create
end

#OLD: master_ip = node['eol']['db_master_ip'] ||
  #OLD: search(:node, "recipes:eol\:\:db_master AND chef_environment:#{node.chef_environment}").first.ipaddress
#OLD: slave_ip =  node['eol']['db_slave_ip'] ||
  #OLD: search(:node, "recipes:eol\:\:db_slave AND chef_environment:#{node.chef_environment}").first.ipaddress

if false

  if node['eol']['rails_environment'] == "production"
    @master_password = Chef::EncryptedDataBagItem.load("passwords", node['eol']['db_user_master'])['password']
    @slave_password = Chef::EncryptedDataBagItem.load("passwords", node['eol']['db_user_slave'])['password']
  else
    @master_password = node['eol']['db_pass_master']
    @slave_password = node['eol']['db_pass_slave']
  end

  # Generalized method to write a YML template that needs generic DB information
  def db_template(basename)
    template "#{node['eol']['release_path']}/shared/config/#{basename}.yml" do
      source "#{basename}.yml.erb"
      mode '0755'
      owner node['deployer']['user']
      group node['deployer']['user']
      variables({
        db_environment: node['eol']['db_environment'] || node['eol']['rails_environment'],
        db_master_port: node['eol']['db_master_port'], # TODO - test what happens when this is undefined
        db_slave_port: node['eol']['db_slave_port'], # TODO - test what happens when this is undefined
        db_prefix: node['eol']['db_prefix'],
        db_logging_prefix: node['eol']['db_logging_prefix'],
        environment: node['eol']['rails_environment'],
        master_host: node['eol']['db_master_ip'],
        master_user: node['eol']['db_user_master'],
        master_password: @master_password,
        slave_host: node['eol']['db_slave_ip'],
        slave_password: @slave_password,
        slave_user: node['eol']['db_user_slave']
      })
    end
  end

end

if false
  # database.yml file
  db_template('database')

  # shards.yml file
  db_template('shards')

  # directory structure
  [ node['eol']['release_path'],
    "#{node['eol']['release_path']}/shared",
    "#{node['eol']['release_path']}/shared/config",
    "#{node['eol']['release_path']}/shared/sitemap",
    "#{node['eol']['release_path']}/shared/config/unicorn",
    "#{node['eol']['release_path']}/releases",
    "#{node['eol']['release_path']}/shared/pids",
    "#{node['eol']['release_path']}/shared/log"
  ].each do |path|
    directory path do
      owner node['deployer']['user']
      group node['deployer']['user']
      mode "0775"
      action :create
      recursive true
    end
  end
end

# eol codebase
# rails
# nokogiri
# libxml2 (via chef)
# bundler
# 
