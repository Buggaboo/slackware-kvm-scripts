#!/bin/sh

IPADDR=192.168.1.153
MNTSRC=/home/user
MNTTGT=~/mnt/kvm
USER=user

mkdir -p $MNTTGT
$(which sshfs) $USER@$IPADDR:$MNTSRC $MNTTGT
$(which ssh) -X -L 5901:$IPADDR:5901 $USER@$IPADDR
# localhost:5901 corresponds to vncserver on vps on :1

