#!/bin/sh
cp config/default/nintendo3ds_ctr.dts linux/arch/arm/boot/dts
cp config/default/nintendo3ds_ktr.dts linux/arch/arm/boot/dts
rm linux/arch/arm/boot/dts/nintendo3ds_*.dtb
# Will probably break in the future
sed -i "s@keep_bootcon fbcon=rotate:1 rdinit=/bin/sh@$(cat $1)@g" linux/arch/arm/boot/dts/nintendo3ds_ctr.dts
sed -i "s@keep_bootcon fbcon=rotate:1 rdinit=/bin/sh@$(cat $1)@g" linux/arch/arm/boot/dts/nintendo3ds_ktr.dts
