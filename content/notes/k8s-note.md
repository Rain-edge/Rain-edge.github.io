+++
title = 'Kubernetes 学习笔记：从 Pod 到 Service'
date = 2026-08-11T20:00:00+08:00
draft = false
tags = ['Kubernetes', '笔记']
+++

Pod 是 Kubernetes 最小的调度单元，一个 Pod 内的容器共享网络和存储命名空间。

Service 为动态变化的 Pod 提供稳定的访问入口，通过标签选择器关联后端 Pod。

> 学习建议：先理解 Pod 生命周期，再学习 Service 的三种类型（ClusterIP、NodePort、LoadBalancer）。
