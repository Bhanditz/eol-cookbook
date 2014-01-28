default['eol']['db_pass_master'] = "change_me_later"
default['eol']['db_pass_slave'] = "this_is_bad"
default['eol']['environment'] = "development"
default['eol']['release_path'] = "/var/www/eol"

default['deployer']['user'] = "eol_#{node['eol']['environment']}_deploy"
