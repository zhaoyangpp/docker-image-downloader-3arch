# 🚢 Docker Image Downloader (3-Arch)

三个 GitHub Actions 工作流，自动拉取并打包 Docker 镜像为 `tar.gz`，支持 **x86-64 / ARM64 / ARM32**。

---

## 🔧 功能特性
- 多架构：`linux/amd64`、`linux/arm64`、`linux/arm/v7`
- 多镜像输入：支持逗号或换行分隔，自动去除多余空格
- 自动压缩：输出 `*-arch.tar.gz`
- 可选私有仓库登录（DOCKER_USERNAME / DOCKER_PASSWORD）
- 自动发布：上传 Release，附带构件下载
- 失败即停：脚本启用 `set -euo pipefail`

---

## 🚀 使用步骤（Actions）
1. 将仓库上传到 GitHub。
2. 打开 **Actions**，选择工作流：
   - `x86-64 Pull and Save Docker Image`
   - `ARM64 Pull and Save Docker Image`
   - `ARM32 Pull and Save Docker Image`
3. 点击 **Run workflow**，在输入框填写镜像（逗号或换行分隔），示例：
   ```
   nginx:latest
   alpine:latest
   ```
   或 `nginx:latest, alpine:latest`
4. 等待任务完成，在右侧 **Artifacts** 下载 `.tar.gz`，或到对应 Release 下载。

---

## 🔑 私有仓库登录（可选）
仓库 `Settings` → `Secrets and variables` → `Actions` 添加：
- `DOCKER_USERNAME`
- `DOCKER_PASSWORD`

配置后会自动 `docker login registry.cn-hangzhou.aliyuncs.com`；未配置则跳过登录。

---

## 📂 输出命名规则
- 每个镜像生成：`<image>-<arch>.tar.gz`
- 镜像名中的 `/`、`:` 会被替换为 `_`，如：`nginx:latest` → `nginx_latest-arm64.tar.gz`

---

## 🧪 本地脚本示例
```bash
bash scripts/save_image_arch.sh nginx:latest linux/arm64 arm64
```

---

## 🔍 已改进要点
- `permissions: contents: write` 允许 Release 写入
- 失败即停：`set -euo pipefail`
- 输入更健壮：逗号/换行分隔，去除空格，过滤空行
- Release 正文使用真实换行的镜像列表
- x86-64 也上传构件，行为与 ARM 流程一致

MIT © 2025 zhaoyangpp
