#!/bin/bash

# ==============================================
# 1. 强制默认语言为中文（核心！）
# ==============================================
sed -i 's/auto/zh_cn/g' openwrt/feeds/luci/modules/luci-base/root/etc/config/luci
sed -i 's/en_us/zh_cn/g' openwrt/feeds/luci/modules/luci-base/root/etc/config/luci
echo " Luci 语言已设置为中文"

# ==============================================
# 2. 主题改为 Argon 中文友好（最像爱快）
# ==============================================
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# ==============================================
# 3. 设备在线状态 + 上下线时间 + 流量统计
# ==============================================
./scripts/feeds install luci-app-wrtbwmon    # 实时流量排行
./scripts/feeds install luci-app-nlbwmon    # 历史流量统计
./scripts/feeds install luci-app-lanstat    # 设备上下线时间
./scripts/feeds install luci-app-device-tracker

# ==============================================
# 4. 你要的核心功能（全部中文界面）
# ==============================================
./scripts/feeds install luci-app-mwan3      # 多线负载均衡
./scripts/feeds install luci-app-ddns       # DDNS
./scripts/feeds install luci-app-zerotier   # ZeroTier
./scripts/feeds install luci-app-wol        # 网络唤醒
./scripts/feeds install luci-app-store istore  # iStore商店

# ==============================================
# 5. 流量控制、限速（类爱快）
# ==============================================
./scripts/feeds install luci-app-sqm
./scripts/feeds install luci-app-eqos

# ==============================================
# 6. IPv6 完整支持
# ==============================================
./scripts/feeds install luci-proto-ipv6
./scripts/feeds install odhcp6c
./scripts/feeds install odhcpd-ipv6only
./scripts/feeds install ip6tables

# ==============================================
# 7. 预装大量工具，让固件达到 800M-1G
# ==============================================
./scripts/feeds install luci-app-filebrowser
./scripts/feeds install luci-app-diskman
./scripts/feeds install luci-app-upnp
./scripts/feeds install luci-app-ttyd
./scripts/feeds install luci-app-arpbind
./scripts/feeds install ntfs-3g-utils
./scripts/feeds install block-mount
./scripts/feeds install e2fsprogs

# ==============================================
# 8. 安装中文翻译包（关键！）
# ==============================================
./scripts/feeds install luci-i18n-base-zh-cn
./scripts/feeds install luci-i18n-mwan3-zh-cn
./scripts/feeds install luci-i18n-ddns-zh-cn
./scripts/feeds install luci-i18n-wol-zh-cn
./scripts/feeds install luci-i18n-zerotier-zh-cn
./scripts/feeds install luci-i18n-sqm-zh-cn
./scripts/feeds install luci-i18n-eqos-zh-cn
./scripts/feeds install luci-i18n-upnp-zh-cn
