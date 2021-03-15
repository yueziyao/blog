---
title: 前端性能爬虫方案
date: 2021-01-27 23:29:00
tags:
    - 前端
    - 性能优化
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

main.ts

```js
import {performanceTest} from './performanceTest'

async function main() {
    // 检测页面url
    const url = 'https://www.baidu.com';
    // 检测次数
    const times = 1;
    await performanceTest(url, times)
}

main()
```

performanceTest.ts 

```js
import * as puppeteer from 'puppeteer';

interface Itiming {
  responseStart: number;
  navigationStart: number;
  responseEnd: number;
  connectEnd: number;
  connectStart: number;
  domInteractive: number;
  fetchStart: number;
  domainLookupEnd: number;
  domainLookupStart: number;
}

export async function performanceTest(url: string, times: number) {

  const record = {
    whiteScreenTime: 0,
    requestTime: 0,
    tcpTime: 0,
    tti: 0,
    dnsTime: 0
  }

  for (let i = 0; i < times; i++) {
    const browser = await puppeteer.launch({ headless: false });
    const page = await browser.newPage();

    await page.goto(url);
    const res = JSON.parse(await page.evaluate(
      () => JSON.stringify(window.performance.timing)
    ))
    const timing: Itiming = res;
    // 等待保证页面加载完成
    await page.waitForTimeout(5000);
    // 白屏时间
    record.whiteScreenTime += timing.responseStart - timing.navigationStart;
    // 请求时间
    record.requestTime += timing.responseEnd - timing.responseStart;
    // TCP建立连接耗时
    record.tcpTime += timing.connectEnd - timing.connectStart;
    // tti
    record.tti += timing.domInteractive - timing.fetchStart;
    // DNS
    record.dnsTime += timing.domainLookupEnd - timing.domainLookupStart || 0;

    await browser.close();
  }
  
  const res = {
    "DNS请求时间": record.dnsTime / times + 'ms',
    "TTI": record.tti / times + 'ms',
    "TCP建立连接耗时": record.dnsTime / times + 'ms',
    "白屏时间": record.whiteScreenTime / times + 'ms',
    "请求时间": record.requestTime / times + 'ms'
  };
  console.log(res);
}
```

后续可以增加static扫描