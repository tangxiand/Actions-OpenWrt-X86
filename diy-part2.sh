#!/bin/bash

# ==========================================
# 强制开机默认中文（必加，否则还是英文）
# ==========================================
mkdir -p files/etc/uci-defaults/
cat > files/etc/uci-defaults/99-default-lang <<EOF
uci set luci.main.lang=zh_cn
uci commit luci
EOF

# ==========================================
# 默认主题改为 Argon（接近爱快）
# ==========================================
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile
