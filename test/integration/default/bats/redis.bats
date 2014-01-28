#!/usr/bin/env bats

@test "redis is installed" {
  [ "$(redis-server --version)" ]
}

@test "redis is listening on port 6379" {
  [ "$(netstat -plant | grep redis | grep 6379)" ]
}
