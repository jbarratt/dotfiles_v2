#!/bin/sh

cd $(dirname "$0")
OS=`uname -s`
TASK=${1:-"default"}
./bin/homemaker.$OS -clobber --verbose --task=$TASK config.toml .
