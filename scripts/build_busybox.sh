#!/bin/sh
source ./config/buildtools.sh
cd busybox
make $MAKEFLAGS
cd ..
