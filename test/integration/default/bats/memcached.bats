#!/usr/bin/env bats

@test "Memcached is installed" {
  [ "$(memcached -info | grep 'memcached 1[.]4')" ]
}
