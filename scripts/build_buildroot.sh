#!/bin/sh
source ./config/buildtools.sh
cd buildroot
make $MAKE_FLAGS
cd ..
