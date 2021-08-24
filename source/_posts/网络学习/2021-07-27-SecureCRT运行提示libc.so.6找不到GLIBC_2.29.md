---
layout: post
title: SecureCRT运行提示libc.so.6找不到GLIBC_2.29
date: 2021-07-27 09:04:33
Author: 来自AJian
categories: 
tags: [网络学习,SecureCRT]
comments: true
---



在UOSBeta5中安装SecureCRT，8.7.3,运行时提示找不到版本为GLIBC_2.29的libm.so.6文件

```
:~$ SecureCRT 
SecureCRT: /lib/x86_64-linux-gnu/libm.so.6: version `GLIBC_2.29' not found (required by SecureCRT)
:~$
```

网上查找了资料

根据这条命令可以查询libm.so.6所支持的版本

```
:~$ strings  /lib/x86_64-linux-gnu/libm.so.6 | grep GLIBC_
GLIBC_2.2.5
GLIBC_2.4
GLIBC_2.15
GLIBC_2.18
GLIBC_2.23
GLIBC_2.24
GLIBC_2.25
GLIBC_2.26
GLIBC_2.27
GLIBC_2.28
GLIBC_PRIVATE
:~$ 

```

从上面结果可以看到GLIBC支持到了2.28,但是我们现在需要的是2.29

到 [http://www.gnu.org/software/libc](http://www.gnu.org/software/libc) 下载新的GLIBC

找到对应版本进入页面下载

对应版本链接为 [http://mirrors.nju.edu.cn/gnu/libc/glibc-2.29.tar.gz](http://mirrors.nju.edu.cn/gnu/libc/glibc-2.29.tar.gz)

可以通过wget获取, 以下是下载编译和使用过程，这里有编译好的libm文件可以 [下载](https://jzjbyq.lanzoui.com/iqy8upz1euf
)

```
$ cd ~/Downloads/
$ wget http://mirrors.nju.edu.cn/gnu/libc/glibc-2.29.tar.gz
--2021-07-27 09:17:50--  http://mirrors.nju.edu.cn/gnu/libc/glibc-2.29.tar.gz
正在解析主机 mirrors.nju.edu.cn (mirrors.nju.edu.cn)... 210.28.130.3, 2001:da8:1007:4011::3
正在连接 mirrors.nju.edu.cn (mirrors.nju.edu.cn)|210.28.130.3|:80... 已连接。
已发出 HTTP 请求，正在等待回应... 200 OK
长度：32592893 (31M) [application/octet-stream]
正在保存至: “glibc-2.29.tar.gz”

glibc-2.29.tar.gz           100%[=========================================>]  31.08M  9.97MB/s  用时 3.1s    

2021-07-27 09:17:53 (9.97 MB/s) - 已保存 “glibc-2.29.tar.gz” [32592893/32592893])
#解压
tar zxvf glibc-2.29.tar.gz
#创建编译目录，并进入该目录
$ mkdir -p glibc-2.29/build && cd glibc-2.29/build

#检查运行编译环境,如果有报错：These critical programs are missing or too old: bison
$ ../configure --prefix=$HOME/Downloads/glibc-2.29/build
#需要执行安装 sudo apt install bison
$ ../configure --prefix=$HOME/Downloads/glibc-2.29/build

#开始编译,等待时间约5分钟
make -j4

#将编译后的文件复制到 /lib/x86_64-linux-gnu/
sudo cp ~/Downloads/glibc-2.29/build/lib/libm-2.29.so /lib/x86_64-linux-gnu/
#设置 libm.so.6 链接到新的文件上
sudo ln -s -f /lib/x86_64-linux-gnu/libm-2.29.so /lib/x86_64-linux-gnu/libm.so.6

#再次运行SecureCRT就可以正常打开了
```

