---
title: chrome tracing
date: 2021-02-02 22:54:09
tags:
---

在学习puppeteer写性能爬虫的时候，又发现一个知识点。

我滴天，前端真是永无止境呀！

```js
// puppeteer中
await page.tracing.start({path: 'trace.json'});
await page.goto('https://www.google.com');
await page.tracing.stop();
```

在谷歌浏览器中，输入以下地址，点击`Load`按钮，导入trace.json。 

```
chrome://tracing/
```

你会发现

![chrome tracing](trace.png)

好的，又发现一个知识点，“一波未平一波又起”呀～～泪奔～干他！

待续～～

---