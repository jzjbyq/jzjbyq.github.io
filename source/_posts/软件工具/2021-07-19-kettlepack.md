---
layout: post
title: KettlePack 任务管理工具
date: 2021-07-19 15:29:56
Author: 来自AJian
categories: 数据库工具
tags: [数据库工具]
comments: true
---



**KettlePack 任务管理工具**

软件简介

​        KettlePack是一个基于Kettle9（兼容Kettle8及其他版本）的web端调度监控管理平台，专门用来调度和监控由Kettle客户端创建的Job和Transformation，安装使用简单方便，并拥有完善的帮助文档和在线支持，目前基本可以支持所有的组件，包括大数据组件（hbase、hive、hdfs等）。

主要功能说明

一体化任务管理：KettlePack可将kettle生成的ktr和kjb文件进行批量导入，支持成千上万个kettle任务的同时处理。

可视化运维监控：提供丰富的运维监控视图，实时查看作业运行日志，log日志，kettle内部的运行日志，系统操作日志等。

基于文件资源库：KettlePack内部集成文件资源库，通过KettlePack文件管理路径来存放所有需要监控运维的作业及转换。

完整的定时策略：KettlePack集成定时策略，可以根据定时策略来执行kettle的作业及转换任务。

主界面概览

![预览图](https://i.loli.net/2021/07/19/NJa2U58vSnVTQot.png)

功能说明：

执行中任务：当前KettlePack中运行的全部任务数量，包括作业数量和转换数量。

转换成功率(一周)：最近一周内，转换任务的成功率。（成功率=转换成功数 ÷ 总转换任务数 × 100%）

作业成功率(一周)：最近一周内，作业任务的成功率。（成功率=转换成功数 ÷ 总转换任务数 × 100%）

任务执行情况：条形统计图统计最近一周转换/作业的成功或失败的具体数量。

任务监控：7天内，作业和转换的监控状况，可以通过折线图的方式监控每日作业及转换的变化规律。

作业及错误记录：显示正在运行中的任务（转换和作业），以及任务对应的错误记录，可以方便快捷的定位问题所在。

 

测试地址:  [http://kettlepack.congjing.net/](http://kettlepack.congjing.net/)

试用账号:  guest

试用密码:  guest

KettlePack 软件下载地址

[http://www.congjing.net/h-col-139.html](http://www.congjing.net/h-col-139.html)

对软件有什么问题可以到 QQ群：491723218 问询