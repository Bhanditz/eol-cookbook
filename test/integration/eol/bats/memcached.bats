#!/usr/bin/env bats

@test "Memcached 1.4.x is installed" {
  [ "$(memcached -info | grep 'memcached 1[.]4')" ]
}
