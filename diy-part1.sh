#!/bin/bash

# iStore 商店
echo "src-git istore https://github.com/linkease/istore;main" >> feeds.conf.default

# 常用插件源
echo "src-git kenzo https://github.com/kenzok8/openwrt-packages" >> feeds.conf.default
echo "src-git small https://github.com/kenzok8/small-package" >> feeds.conf.default

# RTL8125 2.5G 网卡驱动
echo "src-git r8125 https://github.com/sbwml/package_kernel_r8125" >> feeds.conf.default
