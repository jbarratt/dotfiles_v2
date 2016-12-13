#!/bin/sh

SCRIPT_DIR="$( cd "$( dirname "$0" )" && pwd )"
OS=`uname -s`
TASK=${1:-"default"}
$SCRIPT_DIR/bin/homemaker.$OS --verbose --task=$TASK config.toml .
