#!/bin/bash

for device in addison; do

DEFCONFIG_FILE=${device}_defconfig

if [ ! -e arch/arm64/configs/$DEFCONFIG_FILE ]; then
	echo "No such file: arch/arm64/configs/$DEFCONFIG_FILE"
	exit -1
fi

# make .config
make ARCH=arm64 CROSS_COMPILE=clang- ${DEFCONFIG_FILE} -j8

mv .config arch/arm64/configs/${DEFCONFIG_FILE}
done
make mrproper -j8
