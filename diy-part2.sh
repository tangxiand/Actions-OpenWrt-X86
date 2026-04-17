#!/bin/bash
# diy-part2.sh

echo "开始微调固件配置..."

# --------------------------------------------------------
# 1. 基础设置：主题与语言
# --------------------------------------------------------

# 将 Argon 主题设为默认，并移除默认的 Bootstrap 主题
sed -i 's/CONFIG_PACKAGE_luci-theme-bootstrap=y/CONFIG_PACKAGE_luci-theme-bootstrap=n/' .config
echo "CONFIG_PACKAGE_luci-theme-argon=y" >> .config
echo "CONFIG_PACKAGE_luci-app-argon-config=y" >> .config

# 确保中文语言包被选中
echo "CONFIG_PACKAGE_luci-i18n-base-zh-cn=y" >> .config

# --------------------------------------------------------
# 2. 增强设置：数据持久化 (针对 nlbwmon 和 statistics)
# --------------------------------------------------------
# 默认情况下，监控数据存在 /tmp 下，重启会丢失。
# 以下补丁将其修改为 /etc 下（需配合 Overlay 分区使用），确保重启后流量记录还在。

# 修改 nlbwmon 的默认配置，将数据库路径改为 /etc/nlbwmon.db
sed -i 's|option database_path.*|option database_path "/etc/nlbwmon.db"|' package/feeds/luci/luci-app-nlbwmon/root/etc/config/nlbwmon 2>/dev/null

# 修改 statistics (collectd) 的默认配置，将数据目录改为 /etc/collectd
sed -i 's|option database_path.*|option database_path "/etc/collectd"|' package/feeds/luci/luci-app-statistics/root/etc/config/statistics 2>/dev/null

# --------------------------------------------------------
# 3. 固件大小与分区设置
# --------------------------------------------------------
# 确保根文件系统分区大小为 1024MB (1GB)，满足您 800M 左右空间的需求
sed -i 's/CONFIG_TARGET_ROOTFS_PARTSIZE=[0-9]*/CONFIG_TARGET_ROOTFS_PARTSIZE=1024/' .config

echo "固件配置微调完成。"
