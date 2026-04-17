#!/bin/bash

# 更新 feeds
./scripts/feeds update -a

# --- 移除冲突源 (lienol) ---
# 不再添加 lienol 源，避免 verysync 等插件报错

# --- 添加常用插件源 (替代方案) ---
# 使用 kenzok8 源获取 PassWall, SSR+, 动态DNS 等常用插件
git clone https://github.com/kenzok8/openwrt-packages.git package/kenzok8
git clone https://github.com/kenzok8/small.git package/small

# --- 添加 iStore 源 ---
# 保持你之前的写法，但确保在 feeds 目录下
rm -rf feeds/istore
git clone https://github.com/istore/istore.git feeds/istore

# 再次更新 feeds
./scripts/feeds update -a

# 安装所有 feeds
./scripts/feeds install -a
