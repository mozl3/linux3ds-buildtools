#!/bin/sh

if [ $# -eq 0 ]; then
    echo "Usage: $0 overlay_name"
    exit -1
fi

if [ ! -d "overlays/$1" ]; then
	echo "Overlay doesn't exist."
	exit -1
fi

rm linux/rootfs.cpio*

echo Generating overlay rootfs

cp -r overlays/common/rootfs tmprootfs
cp -r overlays/$1/rootfs/* tmprootfs/
cd tmprootfs
find . | LC_ALL=C sort | cpio  --quiet -o -H newc > ../linux/rootfs.cpio
cd ..
rm -rf tmprootfs
gzip linux/rootfs.cpio

if [ ! -f "overlays/$1/cmdline" ]; then
	echo Using default cmdline
	./scripts/set_cmdline.sh overlays/common/cmdline
else
	echo Using overlay cmdline
	./scripts/set_cmdline.sh overlays/$1/cmdline
fi

echo Building kernel

mkdir -p output
./scripts/build_linux.sh
cp linux/arch/arm/boot/zImage output/zImage_$1
cp linux/arch/arm/boot/dts/nintendo3ds_ctr.dtb output/nintendo3ds_ctr_$1.dtb
cp linux/arch/arm/boot/dts/nintendo3ds_ktr.dtb output/nintendo3ds_ktr_$1.dtb
