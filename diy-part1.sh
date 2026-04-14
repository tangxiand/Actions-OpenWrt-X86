#!/bin/bash

# iStore 应用商店
echo "src-git istore https://github.com/linkease/istore;main" >> feeds.conf.default

# 设备监控、流量统计、Argon 主题
echo "src-git nexstore https://github.com/kenzok8/small-package" >> feeds.conf.default
echo "src-git extra https://github.com/kenzok8/openwrt-packages" >> feeds.conf.default#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part1.sh
# Description: OpenWrt DIY script part 1 (Before Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Uncomment a feed source
#sed -i 's/^#\(.*helloworld\)/\1/' feeds.conf.default

# Add a feed source
echo 'src-git helloworld https://github.com/fw876/helloworld' >>feeds.conf.default
#echo 'src-git passwall https://github.com/xiaorouji/openwrt-passwall' >>feeds.conf.default
