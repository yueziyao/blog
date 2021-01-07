---
title: macOS Big Sur osx系统引导盘制作
date: 2021-01-07 17:37:22
tags:
    - macOS
---
> macOS启动优盘制作

### 1.格式化U盘

打开 “应用程序 → 实用工具 → 磁盘工具”，将U盘「抹掉」(格式化) 成「Mac OS X 扩展（日志式）」格式、GUID 分区图，并将 U 盘命名为「Install macOS Big Sur」

### 2.下载系统，安装到本机应用

系统在iTunes上下载即可


### 3.使用命令行生成引导盘

```
sudo /Applications/Install\ macOS\ Big\ Sur.app/Contents/Resources/createinstallmedia --volume /Volumes/Install\ macOS\ Big\ Sur /Applications/Install\ macOS\ Big\ Sur.app —nointeraction
```

* 其中 /Volumes/Install\ macOS\ Big\ Sur 的Install macOS Big Sur为U盘名（第一步格式化的时候用,命令行里空格要加\）
* Install macOS Big Sur.app 是下载的app的名字，和 Mojave各有不同