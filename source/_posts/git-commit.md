---
title: Git Commit Message规范
date: 2021-01-23 00:47:56
tags:
    - Git
---

好的提交代码注释，能让我们更快定位问题，了解提交的内容。也是一个很值得实施的规范。

### 1. 格式

每次提交，Commit message 都包含三个部分：Header，Body，Footer。

```
<type>(<scope>): <subject>
// 空一行
<body>
// 空一行
<footer>
```

* Header是必须的，Body 和 Footer 可以省略。
* Header部分只有一行，包括三个字段：type（必需）、scope（可选）和subject（必需）。
* type用于说明 commit 的类别，只允许以下7个标识。

```
feat：新功能（feature）
fix：修补bug
docs：文档（documentation）
style： 格式（不影响代码运行的变动）
refactor：重构（即不是新增功能，也不是修改bug的代码变动）
test：增加测试
chore：构建过程或辅助工具的变动
```

### 2. Webstrom注释格式填充

webstrom -> performance -> plugins

搜索 `Git Commit Template` 插件，点击 install
![安装插件](./install.jpg)
按照好后，原有提交界面会出现一个按钮，如下。
![使用插件](./use.jpg)

点击它，填充应该填充的部分，即自动生成符合规范的有效注释。

