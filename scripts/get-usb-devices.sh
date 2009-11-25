#!/bin/sh

$(which grep) 'P:' /proc/bus/usb/devices | \
$(which sed) 's/P: \+Vendor=\([0-9a-f]\+\) ProdID=\([0-9]\+\) Rev.*/\1:\2/'
