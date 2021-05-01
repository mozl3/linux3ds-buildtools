#!/bin/sh
./scripts/build_buildroot.sh
cp buildroot/output/images/rootfs.cpio.gz linux/
./scripts/update_kernel_config.sh
./scripts/build_linux.sh
mkdir -p output
cp linux/arch/arm/boot/zImage output/zImage_buildroot
cp linux/arch/arm/boot/dts/nintendo3ds_ctr.dtb output/nintendo3ds_ctr_buildroot.dtb
cp linux/arch/arm/boot/dts/nintendo3ds_ktr.dtb output/nintendo3ds_ktr_buildroot.dtb
