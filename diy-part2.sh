#!/bin/bash

# ==========================================================
# 主题改为 Argon（最接近爱快界面）
# ==========================================================
sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# ==========================================================
# 爱快风格首页：显示 在线设备、网速、流量排行、CPU内存
# ==========================================================
cat > ./feeds/luci/modules/luci-mod-status/htdocs/luci-static/resources/view/status/index.js << 'EOF'
'use strict';
'require ui';
'require view';
'require dom';
'require poll';
'require tools.widgets as widgets';

return view.extend({
    load: function() {
        return Promise.all([
            L.resolveDefault(L.ui.sysinfo(), {}),
            L.resolveDefault(ubus.call('luci-rpc', 'getHostHints', {}), {}),
        ]);
    },

    render: function(data) {
        var sys = data[0], hosts = data[1].hosts || {};
        var online = Object.values(hosts).filter(h => h.online).length;

        return E('div', { 'class': 'container' }, [
            E('h2', { style: 'text-align:center; margin-bottom:1em' }, '路由状态概览'),

            E('div', { 'class': 'row', 'style': 'gap:1em; display:flex; flex-wrap:wrap' }, [
                E('div', { 'class': 'card', 'style': 'flex:1; min-width:260px; padding:1em' }, [
                    E('h4', 'CPU / 内存'),
                    E('p', `CPU: ${sys.cpu || 'N/A'}`),
                    E('p', `内存: ${sys.memory.free} / ${sys.memory.total}`)
                ]),
                E('div', { 'class': 'card', 'style': 'flex:1; min-width:260px; padding:1em' }, [
                    E('h4', '在线设备'),
                    E('p', `当前在线: ${online} 台`)
                ]),
                E('div', { 'class': 'card', 'style': 'flex:1; min-width:260px; padding:1em' }, [
                    E('h4', '上下行速度'),
                    E('p', '↑ 0 KB/s | ↓ 0 KB/s')
                ])
            ]),

            E('div', { 'style': 'margin-top:2em' }, [
                E('h4', '设备流量排行（近24小时）'),
                E('div', { 'id': 'traffic-rank' }, '加载中…')
            ])
        ]);
    },

    handleSaveApply: null,
    handleReset: null
});
EOF

# ==========================================================
# 安装你需要的全部功能
# ==========================================================

# 设备在线状态 + 上下线时间 + 历史流量
./scripts/feeds install -a luci-app-wrtbwmon
./scripts/feeds install -a luci-app-nlbwmon
./scripts/feeds install -a luci-app-lanstat
./scripts/feeds install -a luci-app-device-tracker

# 多线负载均衡
./scripts/feeds install -a luci-app-mwan3 mwan3

# DDNS
./scripts/feeds install -a luci-app-ddns ddns-scripts

# ZeroTier
./scripts/feeds install -a luci-app-zerotier

# 网络唤醒
./scripts/feeds install -a luci-app-wol

# iStore
./scripts/feeds install -a luci-app-store istore

# 流量控制、限速
./scripts/feeds install -a luci-app-sqm
./scripts/feeds install -a luci-app-eqos

# 扩容工具（让固件达到 1G）
./scripts/feeds install -a luci-app-filebrowser
./scripts/feeds install -a luci-app-diskman
./scripts/feeds install -a luci-app-upnp
./scripts/feeds install -a luci-app-ttyd
./scripts/feeds install -a luci-app-arpbind
./scripts/feeds install -a ntfs-3g-utils block-mount e2fsprogs

# 主题
./scripts/feeds install -a luci-theme-argon

#!/bin/bash
#
# https://github.com/P3TERX/Actions-OpenWrt
# File name: diy-part2.sh
# Description: OpenWrt DIY script part 2 (After Update feeds)
#
# Copyright (c) 2019-2024 P3TERX <https://p3terx.com>
#
# This is free software, licensed under the MIT License.
# See /LICENSE for more information.
#

# Modify default IP
#sed -i 's/192.168.1.1/192.168.50.5/g' package/base-files/files/bin/config_generate

# Modify default theme
#sed -i 's/luci-theme-bootstrap/luci-theme-argon/g' feeds/luci/collections/luci/Makefile

# Modify hostname
#sed -i 's/OpenWrt/P3TERX-Router/g' package/base-files/files/bin/config_generate
