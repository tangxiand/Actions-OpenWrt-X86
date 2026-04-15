#!/bin/bash
# 功能：进行编译前的个性化配置微调
set -e

# 1. 预置 ZeroTier 网络 ID (请务必替换 '你的网络ID' 为实际的 ID)
mkdir -p files/etc/config/
cat > files/etc/config/zerotier <<EOF
config zerotier sample_config
    option enabled '1'
    option config_path '/etc/zerotier'
    list join '你的网络ID'
    option port '9993'
    option secret ''
EOF

# 2. 设置默认主题为 Argon，默认语言为中文
mkdir -p files/etc/config
cat > files/etc/config/luci <<EOF
config core 'main'
    option lang 'zh_cn'
    option mediaurlbase '/luci-static/argon'
    option resourcebase '/luci-static/resources'
EOF

# 3. 针对 default-settings 强制设置默认语言为中文 (如果存在)
if [ -d package/emortal/default-settings ]; then
    sed -i 's/option lang auto/option lang zh_cn/g' package/emortal/default-settings/files/99-default-settings
fi
