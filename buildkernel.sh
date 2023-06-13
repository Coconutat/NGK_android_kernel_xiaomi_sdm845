#!/bin/bash
#设置环境

# 交叉编译器路径
export PATH=$PATH:/home/coconutat/github/proton-clang-master/bin
export CC=clang
export CLANG_TRIPLE=aarch64-linux-gnu-
export CROSS_COMPILE=aarch64-linux-gnu-
export CROSS_COMPILE_ARM32=arm-linux-gnueabi-

export ARCH=arm64
export SUBARCH=arm64
# export DTC_EXT=dtc

if [ ! -d "out" ];
then
	mkdir out
fi

date="$(date +%Y.%m.%d-%I:%M)"


make ARCH=arm64 O=out CC=clang nogravity-dipper_ksu_defconfig
# 定义编译线程数
make ARCH=arm64 O=out $EV -j12 CC=clang 2>&1 | tee kernel_log-${date}.txt
