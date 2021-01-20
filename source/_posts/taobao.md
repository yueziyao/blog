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

如果你们公司有私有npm仓库，例如nex

同时你也想使用公有registry 例如淘宝 or npm

那么只需要做以下配置

```
npm config set registry@alex https://alex.npm.cn
```

只要包带 `@alex`的，都会去 `https://alex.npm.cn` 下载

## 3. npm安装yarn

如果npm使用烦了，可以偶尔使用下yarn

按照指令

```
npm i yarn -g
```

> npm是牛b的，这个命令翻译下就是：我（npm）允许你选择我的潜在对手（yarn），甚至我还帮你引荐！

