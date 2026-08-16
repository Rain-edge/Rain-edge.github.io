+++
title = 'CloudForge'
description = '一个云原生运维平台：FastAPI + Docker + Kubernetes + ArgoCD + 可观测性全家桶'
date = 2026-05-01T10:00:00+08:00
draft = false
cover = 'cloudforge-cover.png'
screenshots = ['cloudforge-shot.png']
stack = ['Kubernetes', 'Docker', 'ArgoCD', 'FastAPI', 'Prometheus', 'Grafana', 'Loki']
status = '开发中'
started = '2026.03'
github = 'https://github.com/Rain-edge/CloudForge'
demo = ''
background = '在学习云原生过程中，我发现部署和管理一套完整的 DevOps 工具链非常繁琐，于是想做一个平台把这些能力整合起来。'
why = '一是把学到的 Kubernetes、CI/CD、可观测性知识串成一个完整的项目；二是为实习面试准备一个有说服力的项目经历。'
features = ['基于 FastAPI 的后端服务，Docker 容器化部署', 'Helm Chart 打包，GitOps 方式通过 ArgoCD 自动部署', 'Prometheus + Grafana 监控告警，Loki 日志聚合，Tempo 链路追踪', 'CI 流水线：代码推送自动构建镜像并触发部署']
process = '项目从 2026 年 3 月开始，先搭基础设施（K8s 集群、Ingress、存储），然后逐个接入可观测性组件，最后用 ArgoCD 把整个部署流程 GitOps 化。'
challenges = 'ArgoCD 的同步策略设计：如何平衡自动同步与人工审批；Loki 与 Prometheus 的数据源在 Grafana 中的统一配置。'
problems = '早期遇到镜像仓库鉴权问题，K8s 拉取私有镜像失败；后来通过 ImagePullSecret + ArgoCD 的 Helm values 注入解决。'
future = '接入 Istio 做服务网格；增加多环境管理（dev/staging/prod）；把平台本身部署流程完整文档化。'
+++

CloudForge 是我为学习和求职准备的云原生运维平台项目。
