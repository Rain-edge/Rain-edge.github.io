+++
title = '用 GitHub Actions 免费部署 Hugo 博客'
date = 2026-08-16T10:00:00+08:00
draft = false
tags = ['GitHub Actions', 'Hugo', 'CI/CD']
+++

这是我博客的第一篇文章，顺便记录一下这个博客本身是怎么部署的——一条完整的免费 CI/CD 流水线。

## 架构

```
本地写 Markdown → git push → GitHub Actions 构建（Hugo）→ 上传构建产物 → 部署到 GitHub Pages
```

## 部署流水线拆解

仓库里的 `.github/workflows/deploy.yml` 干了三件事：

1. **Build job**：checkout 代码（递归拉取主题 submodule）→ 安装 Hugo → `hugo --minify` 生成静态文件到 `public/` → 用 `actions/upload-pages-artifact` 把 `public/` 打包成 artifact
2. **Deploy job**：依赖 build 完成后，用 `actions/deploy-pages` 把 artifact 发布到 Pages 环境
3. 权限和并发控制：`pages: write`、`id-token: write` 是 OIDC 免密部署所必需的，`concurrency` 防止多次 push 并发部署互相覆盖

## 几个值得注意的点

- 主题用 git submodule 管理，所以 checkout 时要开 `submodules: recursive`
- Pages 的 Source 必须选 **GitHub Actions**，而不是传统的 branch 模式
- `baseURL` 要和最终域名完全一致（含结尾的 `/`），否则 CSS/JS 加载不出来

## 为什么说它免费

GitHub Pages 对公开仓库完全免费，Actions 对公开仓库也免费（每月 2000 分钟额度对个人博客绰绰有余）。域名是 `rain-edge.github.io`，以后想用自己的域名也支持。

后续我会在这写 K8s、Docker、Prometheus 相关的踩坑记录，欢迎关注。
