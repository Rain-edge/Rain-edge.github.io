# 开发约束：设计保护协议（⚠️ 所有后续开发必须遵守）

本博客 UI 已经定型，投入了大量时间打磨。以下约束对本项目内的一切改动生效。

## 一、受保护的设计资产（禁止擅自改动）

整体视觉风格、页面布局、配色方案、字体、间距体系、动画、卡片样式、Header、Footer、页面结构、响应式效果——均属已确定的设计资产。

**禁止**：重写页面、修改布局、修改配色、更换字体、重构 CSS、重写动画、替换组件、修改间距、改变卡片风格、修改导航结构。

## 二、当前设计系统（Design Tokens，新增内容必须对齐）

- **配色（浅色）**：背景 `#ffffff`；边框 `#eef0f1`；主文字 `#17181a`；次要文字 `#5c5f66`；点缀青 `#0d9488`；浅青底 `#eef7f5`
- **配色（深色）**：背景 `#121416`；卡片 `#1a1d20`；边框 `#262a2e`
- **字体**：Inter + 系统回退（`-apple-system, 'Segoe UI', 'PingFang SC', 'Microsoft YaHei'`）；标题 letter-spacing `-0.2 ~ -0.8px`
- **圆角**：卡片 `12px`；代码块 `10px`；胶囊按钮/标签 `9999px`
- **阴影**：无阴影（层次靠细边框 `1px solid var(--border)` + hover 边框变深）
- **卡片**：`border: 1px solid var(--border); padding: 20px 24px; margin-bottom: 16px`
- **动画**：
  - 页面标题逐字浮现 `char-pop`（8s 循环，冷色 hsl 185→281，每字符唯一色）
  - logo 逐字浮现 `char-pop-once`（fill-mode: both；sessionStorage 会话内只播一次）
  - 副标题 `fade-up` 延迟 1s 浮现
- **导航结构**：主页 / 文章 / 标签 / 归档 / 搜索 / 关于（右上角一行，顺序固定）
- **布局**：正文主列 720px；页面内大元素宽 495px

## 三、开发规则

1. **扩展优于重写**：新功能用新增 partial / 追加 CSS 块实现，不修改现有块
2. **新样式**追加到 `assets/css/extended/custom.css` **末尾**的新 section，不触碰已有规则
3. **新模板**在站点层 `layouts/partials/` 新增或覆盖，**不动** `themes/PaperMod/`（submodule 保持纯净）
4. 修改现有组件前必须：说明原因 → 列出改动点 → 局部修改 → 确认不影响其他页面
5. 禁止大规模重构；最小改动优先

## 四、技术基线（勿在无明确需求时改动）

- Hugo `0.160.1`；主题 PaperMod 锁定 **tag v8.0**（main 分支与 Hugo 0.160 不兼容，勿升级）
- 站点层覆盖文件：`layouts/partials/{home_info,header,comments,extend_head}.html`；`assets/css/extended/custom.css`；`i18n/zh-cn.yaml`
- `hugo.toml` 关键配置：`defaultContentLanguage = 'zh-cn'`（Hugo 0.160 已弃用顶层 languageCode）；`[params.fuseOpts]` 搜索；`[params.giscus] enabled=false`（评论区骨架，待用户配置后启用）
- i18n 文件名必须为 `zh-cn.yaml`（Hugo 0.160 不再回退 `zh.yaml`）
- CI：`.github/workflows/deploy.yml` —— push main 自动构建并部署 GitHub Pages
- 本地预览：`hugo server -D --port 1313`（或双击 `start-blog.bat`）

## 五、快照与恢复

- Git tag `snapshot-2026-08-16`（已推远程，指向 commit `991b17a`）：`git checkout snapshot-2026-08-16` 恢复
- 桌面 `blog_snapshot_20260816.tar.gz`：源码压缩包备份

## 六、已知坑（避免重复踩）

- 文章 front matter `date` 必须用**过去时间**，未来日期会被 Hugo 静默跳过不渲染
- GitHub Pages HTML 有 10 分钟 CDN 缓存，用户验证效果需无痕窗口
- Windows git-bash 下：长命令会被安全拦截（用脚本文件）；PowerShell 的 `$_` 会被 bash 转义破坏（用 .ps1 文件）
