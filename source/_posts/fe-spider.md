---
title: 前端性能爬虫方案
date: 2021-01-27 23:29:00
tags:
    - 前端性能
---

性能爬虫，我也是刚接触到这个词，发现这篇文章，mark一下

https://www.zoo.team/article/performance-detection
https://juejin.cn/post/6844903933580673032#heading-5
https://segmentfault.com/a/1190000020539159

是不是我看得不仔细，这三篇文章写一个东西，都不太一样。

可以结合前端性能、优化，一起看看。学习！

puppeteer使用cnpm安装

```
npm install -g cnpm --registry=https://registry.npm.taobao.org
```

简易demo

```js
const puppeteer = require('puppeteer');

// 检测页面url
const url = 'http://yueziyao.site';
// 检测次数
const times = 2;
const record = [];

(async () => {
  for (let i = 0; i < times; i++) {
    const browser = await puppeteer.launch({headless: false});
    const page = await browser.newPage();

    await page.goto(url);
    // 等待保证页面加载完成
    await page.waitForTimeout(5000);

    // 获取页面的 window.performance 属性
    const timing = JSON.parse(await page.evaluate(
      () =>JSON.stringify(window.performance.timing)
    ));
    record.push(calculate(timing));
    await browser.close();
  }

  let whiteScreenTime = 0, requestTime = 0, tcpTime=0, tti = 0, dnsTime=0;

  for (let item of record) {
    whiteScreenTime += item.whiteScreenTime;
    requestTime += item.requestTime;
    tcpTime += item.tcpTime;
    tti += item.tti;
    dnsTime +=item.dnsTime;
  }
	
  // 检测计算结果
  const result = [];
  result.push(url);
  result.push(`页面平均白屏时间为：${whiteScreenTime / times} ms`);
  result.push(`页面平均请求时间为：${requestTime / times} ms`);
  result.push(`TCP建立连接耗时：${tcpTime / times} ms`);
  result.push(`TTI：${tti / times} ms`);
  result.push(`DNS查询耗时：${dnsTime / times} ms`);
  console.log(result);

  function calculate(timing) {
    const result = {};
    // 白屏时间
    result.whiteScreenTime = timing.responseStart - timing.navigationStart;
    // 请求时间
    result.requestTime = timing.responseEnd - timing.responseStart;
    // TCP建立连接耗时
    result.tcpTime = timing.connectEnd - timing.connectStart;
    // tti
    result.tti = timing.domInteractive - timing.fetchStart;
    // DNS
    result.dnsTime = timing.domainLookupEnd - timing.domainLookupStart || 0;
    return result;
  }
})();
```