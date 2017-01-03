#!/bin/bash

# Requires cli53 (i.e. `brew install cli53`)

export AWS_PROFILE='serialized'
export PATH="/usr/local/bin:/usr/bin/:$PATH"
ZONE="serialized.net"
case $HOSTNAME in
    (gibson) declare -x HOSTNAME="warpdrive";;
    (klee) declare -x  HOSTNAME="initiative";;
    (*) declare -x HOSTNAME="initiative";;
esac
echo "$HOSTNAME"
REMOTE_IP=$(curl -s ipecho.net/plain)
CURRENT_VALUE=$(dig +short $HOSTNAME.$ZONE)

if [[ $REMOTE_IP =~ [0-9]+\.[0-9]+\.[0-9]+\.[0-9]+ ]] ; then
    if [[ $CURRENT_VALUE != $REMOTE_IP ]] ; then
        cli53 rrcreate --replace $ZONE "$HOSTNAME 60 A $REMOTE_IP"
    fi
fi



