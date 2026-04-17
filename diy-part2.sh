#!/bin/bash

# 修改默认 IP (可选)
sed -i 's/192.168.1.1/192.168.31.1/g' package/base-files/files/bin/config_generate

# 修改默认主机名
sed -i 's/OpenWrt/iStoreOS/g' package/base-files/files/bin/config_generate

# 修改默认主题 (可选)
sed -i 's/CONFIG_PACKAGE_luci-theme-openwrt=y/# CONFIG_PACKAGE_luci-theme-openwrt is not set/g' .config
echo 'CONFIG_PACKAGE_luci-theme-argon=y' >> .config

# 添加自定义脚本 (可选)
# 如果你有自定义的脚本，可以放在这里
