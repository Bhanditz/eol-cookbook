#!/usr/bin/env bats
# TODO - move this to a chef spec and use variables instead of hard-coded paths/users/etc

@test "app directory exists" {
  [ "$(test -d /var/www/eol)" ]
}

@test "database config file exists" {
  [ "$(test -f /var/www/eol/shared/config/database.yml)" ]
}

@test "shards config file exists" {
  [ "$(test -f /var/www/eol/shared/config/shards.yml)" ]
}
