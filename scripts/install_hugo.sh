#!/bin/bash

if [ ! -f "/usr/local/bin/hugo" ] ; then
	wget -O - https://github.com/gohugoio/hugo/releases/download/v0.56.3/hugo_extended_0.56.3_Linux-64bit.tar.gz | sudo tar -C /usr/local/bin -zxvf - hugo
fi

go get -u -v github.com/bep/s3deploy
