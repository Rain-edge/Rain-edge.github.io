---
title: Rain-edge Blog
description: 这个博客本身：Hugo + PaperMod + GitHub Actions 自动部署的个人数字空间
date: 2026-04-10 10:00:00+08:00
draft: false
cover: blog-cover.png
screenshots: []
stack:
- Hugo
- PaperMod
- GitHub Actions
- GitHub Pages
status: 持续维护
started: '2026.04'
github: https://github.com/Rain-edge/Rain-edge.github.io
demo: https://rain-edge.github.io/
background: 需要一个属于自己的数字空间，记录技术、学习、生活和思考，同时博客的 CI/CD 部署流程本身也是 DevOps 实践。
why: 第三方博客平台不可控，自建博客可以完全掌控内容和样式，还能把部署流水线当作一个持续的 CI/CD 练手项目。
features:
- GitHub Actions 推送即部署，零手动操作
- 站内全文搜索、标签、归档、分类体系
- 明暗双主题，逐字动画标题
- Moments 轻量日常流与 Projects 项目展示
process: 选型对比 Jekyll/Hugo/Hexo 后选定 Hugo；锁定 PaperMod v8.0 主题；站点层覆盖实现自定义样式与动画；GitHub
  Actions 双 Job 流水线自动构建部署。
challenges: Hugo 0.160 与 PaperMod 主分支的兼容性问题，需要锁定主题版本并做站点层模板补丁；未来日期文章被静默跳过的问题排查。
problems: 主题搜索的 i18n 文件名匹配问题、robots.txt 在 Hugo 0.160 下不生成的坑，均已通过站点层配置修复并沉淀在 AGENTS.md。
future: 启用 Giscus 评论区；增加照片墙；持续完善内容分区。
---

这就是你正在浏览的博客。
