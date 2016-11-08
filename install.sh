#!/bin/sh

TASK=${1:-"default"}
./bin/homemaker --verbose --task=$TASK config.toml .
