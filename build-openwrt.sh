#!/bin/sh
PREFIX=~

HOME=$(pwd)
mkdir -p $PREFIX
cd $PREFIX

rm -rf openwrt
git clone https://git.openwrt.org/openwrt.git openwrt

cd openwrt
scripts/feeds update -a
scripts/feeds install luci

cp ${HOME}/diffconfig .config
make defconfig

make -j$(nproc)

cd $HOME
