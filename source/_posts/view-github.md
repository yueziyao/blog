---
title: macOS GitHub访问过慢问题解决
date: 2021-01-10 17:54:51
tags:
    - github
    - macOS
---

家里github访问非常缓慢，百度了几个方法，亲测有效。

方法：本地host地址绑定 

1. 打开[dns查询工具网站](http://tool.chinaz.com/dns) 查询域名github.global.ssl.fastly.net解析获取其IP.
2. MacOS找到host文件，在finder里边`command`+`shift`+`G`，前往文件夹`/etc/hosts`,里边的`hosts`文件，拷贝到桌面进行编辑后拷贝回来覆盖即可。

```
//hosts文件中
127.0.0.1	localhost
151.101.109.194 github.global.ssl.fastly.net //新增
```

访问速度可以得到提升