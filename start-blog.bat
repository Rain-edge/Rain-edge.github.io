@echo off
chcp 65001 >nul
cd /d C:\Users\39605\Desktop\blog
echo.
echo 博客启动中... 浏览器打开 http://localhost:1313
echo 按 Ctrl+C 停止
echo.
hugo server -D --port 1313
