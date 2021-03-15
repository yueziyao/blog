---
title: npm各种常用配置
date: 2021-01-21 00:09:28
describe: ddd
tags:
    - npm
---

在日常前端开发过程中npm，可以说是我们最常用的包管理器。而其中配置，并不少所有小伙伴都了解的，下边我们介绍下一些最常用的。

## 1. 下载依赖慢，老是网络中断怎么办？（registry配置）

例如我在命令行中，输入

```
>npm config list

//系统输出
alex@AlexdeMacBook-Pro blog % npm config list
; "user" config from /Users/xxx/.npmrc

registry = "https://registry.npm.taobao.org/" 

……

```

在上边 `registry = "https://registry.npm.taobao.org/"` 代表我设置了淘宝的registry仓库。

> npm 默认设置是它的官方库 http://registry.npmjs.org ，这个大家如果涉及插件开发，都会往这上边传，后续再细说。淘宝的仓库其实也源于npm官方仓库，只不过它会即时去拉取，和使用官方库差不多。

我们通常使用以下命令行去设置仓库指向，

```
// 设置成淘宝库
npm config set registry https://registry.npm.taobao.org

// 设置回npm仓库
npm config set registry http://registry.npmjs.org
```

## 2. 设置别名

如果你们公司有，nexus私有npm仓库,你们开发的插件需要存在里边，不推送到公网。那么,可以给你的所有操作，加上 `--registry` 后带仓库地址。

```
//登录
npm login --registry http://nexus.x.x/repository/npm-hosted/

//发布
npm publish --registry http://nexus.x.x/repository/npm-hosted/
```

通常情况下，我们同时也想使用公有淘宝or npm 镜像，可以做以下配置。

我们的插件以@yzy为组，设置特殊组插件使用私有镜像库。

```
//设置@yzy组的registry到私有库
npm config set @yzy:registry http://nexus.x.x/repository/npm-hosted/
```

只要包带 `@yzy`的，都会去 `http://nexus.x.x/repository/npm-hosted/` 下载

## 3. 通过npm安装yarn

如果npm使用烦了，可以偶尔使用下yarn

按照指令

```
npm i yarn -g
```

> npm是牛b的，这个命令翻译下就是：我（npm）允许你选择我的潜在对手（yarn），甚至我还帮你引荐！

