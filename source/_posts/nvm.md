---
title: Macos安装nvm 实现nodejs版本快速切换
date: 2021-01-10 17:45:10
tags:
    - nodejs
    - macOS
---

团队项目新老共存的情况下，某些时候不得不频繁切换nodejs版本。n模块比较难搞，有一些问题，还是推荐使用nvm。

首先，强烈推荐看官网安装：https://github.com/nvm-sh/nvm
（ps：因为如果插件更新了，下边的教程可能没那么及时更新～）

### 1.1 命令行下载及安装
打开命令行工具，输入以下命令，等待安装成功

	curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.37.2/install.sh | bash

### 1.2 shell的配置
安装完成后，注意区分你的shell是用的zsh和bsah，这里我们不做展开了，感兴趣的可以去看看这两个的区别。

了解自己用的shell后，进行shell的配置如下

	$ cd ~
	
	//下边二选一
	//如果是： zsh
	$ vim ~/.zshrc
	
	//如果是：bash
	$ vim .bash_profile

文件里加入（保存退出是用 `esc` 之后输入 `:wq`）
	
	export NVM_DIR=~/.nvm
	source $(brew --prefix nvm)/nvm.sh

### 1.3  刷新source

	// 也是二选一
	// zsh
	$ source ~/.zshrc
	// bash
	$ source .bash_profile

### 1.4 验证

命令行中，输入

	nvm v

如果正常返回版本号，就ok了！

## 二、Windows安装nvm
ps：如果你之前有安装nodejs，建议先清空nodejs


### 2.1 下载nvm

1. 进入 https://github.com/coreybutler/nvm-windows/releases
2. 找到最新的 nvm-setup.zip下载后安装即可

### 2.2 验证
命令行中，输入

	nvm v

如果正常返回版本号，就ok了！