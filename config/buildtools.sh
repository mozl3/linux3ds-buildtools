#!/bin/sh
TOOLCHAIN="https://toolchains.bootlin.com/downloads/releases/toolchains/armv6-eabihf/tarballs/armv6-eabihf--glibc--bleeding-edge-2020.08-1.tar.bz2"
TOOLCHAIN_PATH=$PWD/toolchain
PULL_TOOLCHAIN=true
PULL_LINUX=true
#If you set this to false you'll have to provide your own rootfs.cpio.gz for now
PULL_BUILDROOT=true
MAKE_FLAGS=-j$(nproc)
