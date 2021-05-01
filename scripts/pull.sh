#!/bin/sh
source ./config/buildtools.sh
mkdir -p config/default 

if [ $PULL_TOOLCHAIN = true ]; then
	if [ ! -d "toolchain/" ]; then
		echo "Pulling toolchain"
		wget -O toolchain.tar.bz2 $TOOLCHAIN
		tar -xvf toolchain.tar.bz2
		mv armv6* toolchain
		rm toolchain.tar.bz2
	fi
fi

if [ $PULL_BUILDROOT = true ]; then
	if [ ! -d "buildroot/" ]; then
		echo "Pulling buildroot"
		git clone https://github.com/linux-3ds/buildroot
		wget -O buildroot/.config https://gist.githubusercontent.com/xerpi/2cf375bd7d06ae1b2974/raw/04400b0346daa74457f5169a900a2b15a8861de9/.config
		sed -i "s,/opt/armv6-eabihf--glibc--bleeding-edge-2020.08-1/,$TOOLCHAIN_PATH,g" buildroot/.config
		mkdir buildroot/rootfs-overlay -p
		./scripts/build_buildroot.sh
	else
		echo "Updating buildroot"
		cd buildroot
		git pull
		cd ..
		./scripts/build_buildroot.sh
	fi
fi

if [ $PULL_LINUX = true ]; then
	if [ ! -d "linux/" ]; then
		echo "Pulling linux"
		git clone https://github.com/linux-3ds/linux
		if [ -d "buildroot/" ]; then
			cp buildroot/output/images/rootfs.cpio.gz linux/
		else
			touch linux/rootfs.cpio.gz
		fi
		cp linux/arch/arm/configs/nintendo3ds_defconfig config/default
		cp linux/arch/arm/boot/dts/nintendo3ds_ctr.dts config/default
		cp linux/arch/arm/boot/dts/nintendo3ds_ktr.dts config/default
		./scripts/update_kernel_config.sh
		./scripts/build_linux.sh
	else
		echo "Updating linux"
		cd linux
		git pull
		make clean
		cd ..
		if [ -d "buildroot/" ]; then
			cp buildroot/output/images/rootfs.cpio.gz linux/
		else
			touch linux/rootfs.cpio.gz
		fi
		cp linux/arch/arm/configs/nintendo3ds_defconfig config/default
		cp linux/arch/arm/boot/dts/nintendo3ds_ctr.dts config/default
		cp linux/arch/arm/boot/dts/nintendo3ds_ktr.dts config/default
		./scripts/update_kernel_config.sh
		./scripts/build_linux.sh
	fi
fi



