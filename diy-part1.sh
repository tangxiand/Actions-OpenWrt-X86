#!/bin/bash

# iStore 应用商店
echo "src-git istore https://github.com/linkease/istore;main" >> feeds.conf.default

# 中文插件 + 流量统计 + 设备监控
echo "src-git kenzo https://github.com/kenzok8/openwrt-packages" >> feeds.conf.default
echo "src-git small https://github.com/kenzok8/small-package" >> feeds.conf.default
