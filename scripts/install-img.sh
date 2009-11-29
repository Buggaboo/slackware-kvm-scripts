#!/bin/sh

set -e -x

if [ -z "$1" ]; then
  echo "Error: No installation cdrom medium!"
  exit 1
fi
if [ -z "$2" ]; then
  echo "Error: No target medium for installation!"
  exit 1
fi

if [ -z "$3" ]; then
  echo "Warning: No tap device chosen to connect to virtual guest!"
  M=tap0
else
  M=$3
fi

if [ -z "$4" ]; then
  echo "Warning: No ethernet device chosen!"
  MODEL=e1000
else
  MODEL=$4
fi



N=$(echo -n $M | sed 's/.*\([0-9]\)$/\1/')
MACADDR="DE:AD:BE:EF:$N$N:$N$N"


QEMU=$(which qemu-system-x86_64)
sudo $QEMU -smp 2 -m 512 -cdrom $1 \
  -hda $2 -boot d \
  -net nic,macaddr=$MACADDR,model=$MODEL \
  -net tap,ifname=$M,script=no

