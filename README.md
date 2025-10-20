# 🐳 Docker Image Downloader (3-Arch Version)

This repository provides **three separate GitHub Actions workflows** to pull and save Docker images
for different architectures: **x86-64**, **ARM64**, and **ARM32**.

---

## 🚀 Usage

1. Upload this repository to GitHub.
2. Go to **Actions** tab → choose a workflow:
   - ARM32 Pull and Save Docker Image
   - ARM64 Pull and Save Docker Image
   - x86-64 Pull and Save Docker Image
3. Click **Run workflow**, and enter the Docker image (e.g. `ubuntu:22.04`).
4. Wait for it to complete, then download the `.tar` artifact.

---

## 🧩 Example
```bash
# Each workflow runs internally like this:
bash scripts/save_image_arch.sh nginx:latest linux/arm64 arm64
```

---

## 🔐 Private Registries
If you need to access private images, add GitHub Secrets:
- DOCKER_USERNAME
- DOCKER_PASSWORD

The workflow will use them for `docker login`.

---

MIT © 2025 zhaoyangpp
