---
title: Bootstrap V5的一些新特性
date: 2021-03-29 21:38:59
tags:
    - 前端
    - Bootstrap V5
---

* 依旧是使用 `SASS` 
* 不出所料IE居然被移出 `Bootstrap V5` 支持范围。[官网链接](https://getbootstrap.com/docs/5.0/getting-started/browsers-devices/#internet-explorer)



发现有以下的一些新的特性

**1.Accessibility 无障碍支持**

无障碍看上去是个特别小众的需求，但是越来越重要。

https://getbootstrap.com/docs/5.0/getting-started/accessibility/

**2.RFS - Responsive Font Sizes**

RFS是啥？

> 原文
> Bootstrap’s side project RFS is a unit resizing engine which was initially developed to resize font sizes (hence its abbreviation for Responsive Font Sizes). Nowadays RFS is capable of rescaling most CSS properties with unit values like margin, padding, border-radius, or even box-shadow.
> The mechanism automatically calculates the appropriate values based on the dimensions of the browser viewport. It will be compiled into calc() functions with a mix of rem and viewport units to enable the responsive scaling behavior.
> 翻译
> Bootstrap的辅助项目RFS是一个单元大小调整引擎，最初是为了调整字体大小而开发的（因此其缩写为Responsive Font Sizes）。如今RFS能够与单位值重新缩放最CSS属性等margin，padding，border-radius，或甚box-shadow。
> 该机制会根据浏览器视口的尺寸自动计算适当的值。它将被编译为calc()具有rem和视口单元混合的函数，以启用响应式缩放行为。

怎么使用待后续补充～暂时没明白应该如何使用。

**3.RTL - Right To Left**

目前处于试验阶段，主要作用是支持系统文字从右到左的切换。有些语系与众不同，不是从左到右的，是从右到左的。排列布局呢就需要特殊定义，看来bs5还是很考虑很全面的。点赞

> Support for right-to-left text in Bootstrap across our layout, components, and utilities.

如何使用，待续～

