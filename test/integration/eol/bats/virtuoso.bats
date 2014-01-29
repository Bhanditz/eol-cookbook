#!/usr/bin/env bats

@test "Virtuoso 1.4.x is installed" {
  [ "$(isql-vt --help | grep 'OpenLink Interactive SQL (Virtuoso)')" ]
}
