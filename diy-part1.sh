#!/bin/bash
# diy-part1.sh

echo "开始下载第三方插件源码..."

# 1. 克隆 iStore 仓库 (应用商店)
git clone https://github.com/linkease/istore.git package/istore

# 2. 克隆 Lienol 的第三方软件包仓库
git clone https://github.com/Lienol/openwrt-package.git package/lienol

# 3. 获取 luci-app-statistics (Netdata 监控)
# 由于该插件在官方源中可能版本较旧或缺失，这里从 coolsnowwolf/lede 仓库获取
git clone https://github.com/coolsnowwolf/lede.git temp_lede
cp -r temp_lede/package/lean/luci-app-statistics package/
rm -rf temp_lede

# 4. 获取 kmod-igc (Intel i225/i226 驱动) 的最新版
# 注意：通常内核自带，但如果需要最新版可从其他源获取，此处暂不额外克隆，依赖主源码内核模块

echo "第三方插件源码下载完成。"
