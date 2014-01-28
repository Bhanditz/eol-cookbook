#!/usr/bin/env bats

@test "mysql > 5.5 is installed" {
  [ "$(mysql --version | grep 'Distrib 5[.][5-9]')" ]
}

@test "mysql is listening on 3306" {
  [ "$(netstat -plant | grep mysql | grep 3306)" ]
}

@test "mysql innodb_buffer_pool_size is 256M" {
  [ "$(grep buffer_pool_size /etc/mysql/my.cnf | cut -d " " -f3 | grep 256M)" ]
}

#TODO replace with ChefSpec
@test "EOL databases exist" {
  [ "$mysql -u root -p`grep "SET PASSWORD FOR 'root'" /etc/mysql_grants.sql | cut -d "'" -f 6` -e \"SHOW DATABASES\"()" ]
}