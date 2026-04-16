#!/bin/bash

# 以下源已经在 feeds.conf.default 里添加，这里注释掉避免重复
# echo "src-git istore https://github.com/linkease/istore;main" >> feeds.conf.default
# echo "src-git kenzo https://github.com/kenzok8/openwrt-packages" >> feeds.conf.default
# echo "src-git small https://github.com/kenzok8/small-package" >> feeds.conf.default
# echo "src-git r8125 https://github.com/sbwml/package_kernel_r8125" >> feeds.conf.default

# 清除旧的，防止冲突
./scripts/feeds clean

# 更新+安装 feeds
./scripts/feeds update -a
./scripts/feeds install -a
