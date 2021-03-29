---
title: NPM依赖配置
date: 2021-03-16 10:19:22
tags:
    - 前端
    - npm
---

记得在学习框架的前期，老是很奇怪，`npm` 安装依赖的时候，一会儿是加 `-D` 一会儿加 `--save`、`-dev`啥的，都是啥、啥、啥呀！

![bq](2032.gif)

好的，我们从头开始～

## 1.“dependencies”和“devDependencies”

通常我们的项目是从一行命令开始的：

```
npm init
```

这个时候，会生成一个文件，它的名字叫 `package.json`，内容是这样的

```json
{
  "name": "test",
  "version": "1.0.0",
  "description": "",
  "main": "index.js",
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1"
  },
  "author": "",
  "license": "ISC"
}
```

当我们安装了依赖，`package.json`中会多依赖的配置：

* dependencies： 表示生产环境下的依赖管理；
* devDependencies： 表示开发环境下的依赖管理；

项目上线以后依然是要继续使用的，我们就要安装在生产环境中，否则上线运行会产生问题。而是生成 `dependencies` 还是 `devDependencies`，主要就取决于安装依赖的方式。

要安装开发环境下的 `devDependencies`，要使用 `--save-dev`.

```
npm install --save-dev packageName
# 简写
npm i -D packageName
```

要安装生产环境下的 `dependencies`，要使用 `--save`

```
npm install --save packageName
# 简写
npm i -S packageName
```

## 2.来点进阶的——“peerDependencies”

参考：

* https://nodejs.org/en/blog/npm/peer-dependencies/
* https://www.cnblogs.com/ajaemp/p/12982101.html

最近有遇到一个问题，可能会用到它！

暂时还没整透彻，整透彻我再补充。
