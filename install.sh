#!/bin/sh

cd $(dirname "$0")
OS=`uname -s`
TASK=${1:-"default"}
$SCRIPT_DIR/bin/homemaker.$OS --verbose --task=$TASK config.toml .
