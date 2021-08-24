---
layout: post
title: SecureCRT使用秘钥登录报libgssapi.so错误
date: 2021-08-17 10:23:49
Author: 来自AJian
categories: 
tags: [网络学习,SecureCRT]
comments: true
---

当SecureCRT使用私钥连接远端计算机时，报libgssapi.so的错误，测试不影响使用，但是会影响连接时对该文件的判断，连接上的延迟会高一些。那么本文就是介绍解决这个弹窗的一个方法。

# ![01](https://i.loli.net/2021/08/17/MSI7KHvY8VB2AbW.png)

```
#检查是否有libgssapi的相关信息
ls -l /usr/lib/x86_64-linux-gnu/|grep libgssapi
#如果有，可以看到如下信息，跳过安装 libkrb5-dev 直接创建软链接
lrwxrwxrwx  1 root root        26 12月 17  2020 libgssapi_krb5.so -> mit-krb5/libgssapi_krb5.so
lrwxrwxrwx  1 root root        21 12月 17  2020 libgssapi_krb5.so.2 -> libgssapi_krb5.so.2.2
-rw-r--r--  1 root root    309744 12月 17  2020 libgssapi_krb5.so.2.2
```

```
#安装 libkrb5-dev
sudo apt-get install libkrb5-dev
```

```
#创建软连接
cd /usr/lib/x86_64-linux-gnu/
sudo ln -s mit-krb5/libgssapi_krb5.so libgssapi.so
```

如此打开的时候就不会再跳提示了。