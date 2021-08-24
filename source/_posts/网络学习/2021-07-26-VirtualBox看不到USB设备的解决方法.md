---
layout: post
title: 解决VirtualBox找不到USB设备的方法
date: 2021-07-26 09:47:45
Author: 来自AJian
categories: 
tags: [Linux学习]
comments: true
---



**安装Oracle VM VirtualBox Extension Pack，需要把linux用户加入 vboxusers 用户组**

```
sudo usermod -aG vboxusers $USER
```

**然后重启系统或者注销用户生效**