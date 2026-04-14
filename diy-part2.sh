#!/bin/bash

# 1. 强制中文
sed -i 's/auto/zh_cn/g' feeds/luci/modules/luci-base/root/etc/config/luci
sed -i 's/en_us/zh_cn/g' feeds/luci/modules/luci-base/root/etc/config/luci

# 2. 主题 Argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 3. 设备监控、流量、上下线
./scripts/feeds install luci-app-wrtbwmon luci-app-nlbwmon luci-app-lanstat luci-app-device-tracker

# 4. 核心功能
./scripts/feeds install luci-app-mwan3 luci-app-ddns luci-app-zerotier luci-app-wol luci-app-store istore

# 5. 流控（仅保留官方稳定的 sqm，移除 eqos）
./scripts/feeds install luci-app-sqm

# 6. IPv6
./scripts/feeds install luci-proto-ipv6 odhcp6c odhcpd-ipv6only ip6tables

# 7. 2.5G 网卡驱动
./scripts/feeds install kmod-igc kmod-r8125 kmod-r8169

# 8. 工具包
./scripts/feeds install luci-app-filebrowser luci-app-diskman luci-app-upnp luci-app-ttyd luci-app-arpbind ntfs-3g-utils block-mount e2fsprogs

# 9. 全中文翻译
./scripts/feeds install luci-i18n-base-zh-cn luci-i18n-mwan3-zh-cn luci-i18n-ddns-zh-cn luci-i18n-wol-zh-cn luci-i18n-zerotier-zh-cn luci-i18n-sqm-zh-cn
