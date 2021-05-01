#!/bin/sh
source ./config/buildtools.sh
cd busybox
make $MAKEFLAGS
cd ..
mkdir -p overlays/common/bin/
cp busybox/busybox overlays/common/bin
