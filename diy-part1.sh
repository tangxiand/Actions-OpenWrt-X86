#!/bin/bash
# 功能：添加第三方软件源与核心软件包
set -e

# 1. 添加第三方软件源
# iStore 应用商店相关源
echo 'src-git istore https://github.com/linkease/istore.git;main' >> feeds.conf.default
echo 'src-git nas https://github.com/linkease/nas-packages.git;master' >> feeds.conf.default
echo 'src-git nas_luci https://github.com/linkease/nas-packages-luci.git;main' >> feeds.conf.default
# kenzok8 常用软件包集合源
echo 'src-git kenzo https://github.com/kenzok8/openwrt-packages' >> feeds.conf.default
echo 'src-git small https://github.com/kenzok8/small' >> feeds.conf.default

# 2. 手动克隆缺失的 LuCI 应用
# Argon 主题
git clone https://github.com/jerrykuku/luci-theme-argon.git package/luci-theme-argon
# ZeroTier 的 LuCI 界面
git clone https://github.com/rufengsuixing/luci-app-zerotier.git package/luci-app-zerotier
# 终端流量监控后端工具
git clone https://github.com/openwrt/openwrt.git package/wrtbwmon

# 3. 更新并安装 feeds
./scripts/feeds update -a
./scripts/feeds install -a
