#!/bin/bash

# ==============================
# 修复 → 强制默认中文（真正生效）
# ==============================
sed -i 's/config language.*/config language '\''zh_cn'\''/' feeds/luci/modules/luci-base/root/etc/config/luci
sed -i 's/auto/zh_cn/g' feeds/luci/modules/luci-base/root/etc/config/luci

# ==============================
# Argon 主题
# ==============================
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# ==============================
# 设备监控
# ==============================
./scripts/feeds install luci-app-wrtbwmon luci-app-nlbwmon luci-app-lanstat luci-app-device-tracker

# ==============================
# 核心功能
# ==============================
./scripts/feeds install luci-app-mwan3 luci-app-ddns luci-app-zerotier luci-app-wol luci-app-store istore

# ==============================
# 流控
# ==============================
./scripts/feeds install luci-app-sqm

# ==============================
# IPv6
# ==============================
./scripts/feeds install luci-proto-ipv6 odhcp6c odhcpd-ipv6only ip6tables

# ==============================
# 2.5G 网卡驱动
# ==============================
./scripts/feeds install kmod-igc kmod-r8125 kmod-r8169

# ==============================
# 工具
# ==============================
./scripts/feeds install luci-app-filebrowser luci-app-diskman luci-app-upnp luci-app-ttyd luci-app-arpbind ntfs-3g-utils block-mount e2fsprogs

# ==============================
# 全插件中文翻译
# ==============================
./scripts/feeds install luci-i18n-base-zh-cn
./scripts/feeds install luci-i18n-mwan3-zh-cn
./scripts/feeds install luci-i18n-ddns-zh-cn
./scripts/feeds install luci-i18n-wol-zh-cn
./scripts/feeds install luci-i18n-zerotier-zh-cn
./scripts/feeds install luci-i18n-sqm-zh-cn
./scripts/feeds install luci-i18n-upnp-zh-cn
