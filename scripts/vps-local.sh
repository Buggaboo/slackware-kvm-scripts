#!/bin/sh

IPADDR=${IPADDR:-192.168.1.202}
MNTSRC=/home/jzz
MNTTGT=~/mnt/kvm
USER=jzz

mkdir -p $MNTTGT
sshfs $USER@$IPADDR:$MNTSRC $MNTTGT
ssh -X -L 5901:$IPADDR:5901 $USER@$IPADDR

