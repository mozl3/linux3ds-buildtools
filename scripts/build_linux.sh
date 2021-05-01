#!/bin/sh
source ./config/buildtools.sh
cd linux
ARCH=arm CROSS_COMPILE=arm-linux- make $MAKE_FLAGS nintendo3ds_defconfig all
cd ..
