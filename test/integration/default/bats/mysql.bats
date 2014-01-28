#!/usr/bin/env bats

@test "mysql > 5.5 is installed" {
  [ "$(mysql --version | grep 'Distrib 5[.][5-9]')" ]
}

@test "mysql is listening on 3306" {
  [ "$(netstat -plant | grep mysql | grep 3306)" ]
}