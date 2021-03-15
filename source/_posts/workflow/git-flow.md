---
title: 团队Git协作实践
date: 2021-01-21 23:29:03
tags:
    - Git
---

## 描述

本规范从以下两个方面规范团队git使用：

1. Git分支操作规范
2. Commit Message规范

## 1. Git分支操作规范

按照团队的情况做以下规范。

### 1.1 分支说明

| 分支英文名 | 分支中文名 | 解释 |
| --- | --- | --- |
| master | 主分支 |  稳定发布的代码|
| test | 测试分支 | 只用于合并和测试的分支，发布到测试环境 |
| feature | feature分支 |用于需求功能开发<br>基本格式：feature/name<br>（eg. feature/userManage） |
| hotfix | hotfix分支 | 为解决线上突发问题的分支<br>基本格式：hotfix/date-description<br>（eg. hotfix/20200811-用户模块选中问题修复） |

### 1.2 各分支操作

#### master分支

master分支，一直存在。

* master合并的内容：本次上线的feature分支的需求。
* master合并的时间：上线的时候。
* master合并操作：只能由模块负责人进行操作，合并前需要review代码，要对风险负责。

#### test分支

test分支，一直存在。

* test分支的内容：合并当前要进行测试的feature分支。
* test合并的时间：需要测试的时候。
* test分支的合并要求：提测什么需求，就合并相关分支的代码（test分支只做合并操作）。

#### feature分支

按需创建，及时销毁。

* feature分支的产生：从master上拉的一个新分支。
* feature分支的合并到test，先在本地进行merge操作，解决冲突之后，再进行push。
* feature分支的销毁：上线完毕后，由分支owner进行销毁。

#### hotfix分支

按需创建，及时销毁。

* hotfix分支的产生：从master上拉的一个新分支。
* hotfix分支的合并：如果需要经过测试，先合并到test分支，测试过后合并到master。如果属于紧急修复，响应时间作为第一参考标准的时候，经过自测，直接合并到master分支。
* hotfix分支的销毁：上线完毕后，由分支owner进行销毁。

### 1.3 分支操作流程

1. 新的需求开发开始，先从 `master分支` 拉一个新的 `feature分支` ，分支需要遵循命名规范。
2. 开发完成，把 `feature分支` 的代码合并到 `test分支` 。
3. 测试阶段开始，测试提出的bug，在该 `feature分支` 上进行修复，修复完成持续合并到 `test分支`。
4. 测试完毕后，收到测试结果邮件，需要发布release环境验证，在发布release环境之前，把 `master分支` 重新合并到 `feature分支`。
5. release验收完成，需要正式上线，必须等产品确认才能把 `feature分支` 的代码合并到 `master分支` ，再进行发布生产环境。

tips：hotfix分支的周期，同feature分支。区别点在于：hotfix在于线上问题的止损，出现问题，可能不会走测试流程。