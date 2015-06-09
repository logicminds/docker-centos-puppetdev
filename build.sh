#!/usr/bin/env bash

eval `boot2docker shellinit`
BRANCH=`git rev-parse --abbrev-ref HEAD`

docker build --rm -t logicminds/centos-puppetdev:$BRANCH .
