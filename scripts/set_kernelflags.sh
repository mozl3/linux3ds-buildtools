#!/bin/sh
cp config/default/nintendo3ds_defconfig linux/arch/arm/configs/
cat $1 >> linux/arch/arm/configs/nintendo3ds_defconfig
