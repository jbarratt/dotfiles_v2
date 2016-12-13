#!/bin/sh

OS=`uname -s`
TASK=${1:-"default"}
./bin/homemaker.$OS --verbose --task=$TASK config.toml .
