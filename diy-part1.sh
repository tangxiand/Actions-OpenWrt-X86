#!/bin/bash
# diy-part1.sh

# 1. 清理可能冲突的旧目录
rm -rf package/istore
rm -rf package/lienol

# 2. 重新克隆
# 注意：istore 仓库结构较深，确保克隆到正确位置
git clone --depth 1 https://github.com/linkease/istore.git package/istore

# Lienol 的包通常直接放在 package 下即可
git clone --depth 1 https://github.com/Lienol/openwrt-package.git package/lienol

# 3. 获取 statistics (Netdata)
git clone --depth 1 https://github.com/coolsnowwolf/lede.git temp_lede
cp -r temp_lede/package/lean/luci-app-statistics package/
rm -rf temp_lede
