#!/bin/sh
TOOLCHAIN="https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--glibc--bleeding-edge-2020.08-1.tar.bz2"
TOOLCHAIN_PATH=$PWD/toolchain
PULL_TOOLCHAIN=true
PULL_LINUX=true
PULL_BUSYBOX=true
PULL_BUILDROOT=false
MAKE_FLAGS=-j$(nproc)
