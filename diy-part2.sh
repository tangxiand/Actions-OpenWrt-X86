#!/bin/bash

# 强制默认中文（100% 生效）
mkdir -p files/etc/uci-defaults/
cat > files/etc/uci-defaults/99-default-language <<EOF
uci set luci.main.lang=zh_cn
uci commit luci
EOF

# 设置默认主题为 Argon
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# 设备管理 + 上下线 + 流量统计
./scripts/feeds install luci-app-wrtbwmon
./scripts/feeds install luci-app-nlbwmon
./scripts/feeds install luci-app-lanstat

# 核心功能
./scripts/feeds install luci-app-mwan3
./scripts/feeds install luci-app-ddns
./scripts/feeds install luci-app-zerotier
./scripts/feeds install luci-app-wol
./scripts/feeds install luci-app-store
./scripts/feeds install istore
./scripts/feeds install socat

# 流控
./scripts/feeds install luci-app-sqm

# IPv6
./scripts/feeds install luci-proto-ipv6
./scripts/feeds install odhcp6c
./scripts/feeds install odhcpd-ipv6only

# 2.5G 网卡驱动
./scripts/feeds install kmod-igc
./scripts/feeds install kmod-r8125
./scripts/feeds install kmod-r8169

# 工具包（固件达到 1G）
./scripts/feeds install luci-app-filebrowser
./scripts/feeds install luci-app-diskman
./scripts/feeds install luci-app-upnp
./scripts/feeds install luci-app-ttyd
./scripts/feeds install ntfs-3g-utils
./scripts/feeds install block-mount
./scripts/feeds install e2fsprogs

# 全插件中文翻译
./scripts/feeds install luci-i18n-base-zh-cn
./scripts/feeds install luci-i18n-mwan3-zh-cn
./scripts/feeds install luci-i18n-ddns-zh-cn
./scripts/feeds install luci-i18n-wol-zh-cn
./scripts/feeds install luci-i18n-zerotier-zh-cn
./scripts/feeds install luci-i18n-sqm-zh-cn
./scripts/feeds install luci-i18n-upnp-zh-cn
