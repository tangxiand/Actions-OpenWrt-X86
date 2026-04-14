#!/bin/bash

# iStore 商店
echo "src-git istore https://github.com/linkease/istore;main" >> feeds.conf.default

# 常用插件源（中文、流控、设备监控）
echo "src-git kenzo https://github.com/kenzok8/openwrt-packages" >> feeds.conf.default
echo "src-git small https://github.com/kenzok8/small-package" >> feeds.conf.default

# 2.5G 瑞昱 RTL8125 驱动源（关键！）
echo "src-git r8125 https://github.com/sbwml/package_kernel_r8125" >> feeds.conf.default
