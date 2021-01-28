---
title: 前端性能衡量标准
date: 2021-01-28 16:27:23
tags:
    - 前端
---

谈前端性能方面的指标，可以参考：

* [《以用户为中心的性能指标》-Google推荐](https://web.dev/user-centric-performance-metrics/#user-centric_performance_metrics)

可以使用谷歌的performce，来查看性能。

![谷歌开发工具](chrome.png)

Timings 里`FP` `FCP` `LCP` `DCL` 等参数，做重点分析。

## FP&FCP - First Paint & First Contentful Paint

一般用FCP来衡量即可，FP一般都在FCP之前：

* FP 记录页面第一次绘制像素的时间
* FCP 记录页面首次绘制文本、图片、非空白 Canvas 或 SVG 的时间

FCP指标:

* great 0-2
* mid 2-4
* bad 4-x

## LCP - Largest Contentful Paint

LCP指标代表的是视窗最大可见图片或者文本块的渲染时间。

这个性能指标，可以测试用户感知到的页面加载速度，更可以让用户感受到这个页面的可用性。

![web LCP](lcp.png)

* LCP的官方api：https://wicg.github.io/largest-contentful-paint/#sec-largest-contentful-paint-interface
* 插件：https://github.com/GoogleChrome/web-vitals

待续～～