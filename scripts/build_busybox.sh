#!/bin/sh
source ./config/buildtools.sh
cd busybox
make $MAKEFLAGS
cd ..
mkdir -p overlays/common/rootfs/{bin,mnt,proc,dev,sys}
mknod overlays/common/rootfs/dev/null c 1 3
mknod overlays/common/rootfs/dev/tty c 5 0
mknod overlays/common/rootfs/dev/console c 5 1
cp busybox/busybox overlays/common/rootfs/bin
ln -s /bin/busybox overlays/common/rootfs/bin/ash
ln -s /bin/busybox overlays/common/rootfs/bin/clear
ln -s /bin/busybox overlays/common/rootfs/bin/mount
ln -s /bin/busybox overlays/common/rootfs/bin/umount
ln -s /bin/busybox overlays/common/rootfs/bin/mknod
ln -s /bin/busybox overlays/common/rootfs/bin/chroot
