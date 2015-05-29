#!/usr/bin/env bash


BRANCH=`git rev-parse --abbrev-ref HEAD`

docker build --rm -t logicminds/centos-puppetdev:$BRANCH .
