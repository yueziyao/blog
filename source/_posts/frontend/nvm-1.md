---
title: nvm使用
date: 2021-01-22 14:24:48
tags:
    - 前端
---

接上文说到，我们使用nvm来维护我们的nodejs版本。

主要就是使用nvm安装、查询、切换功能

### check - 检查当前系统所使用的版本

```
nvm list
```

### list available versions - 列出已发布的可用版本

```
nvm ls-remote
```

### install - 安装某个版本

```
nvm install node # 安装最新稳定版
nvm install 10.14.3 # 安装 10.14.3 版本
```

### using - 切换版本

```
nvm use node # 切换到最近版本
nvm use 10.14.3 # 切换 10.14.3 版本
```
