# 🐳Docker多架构镜像离线下载器（x86/ARM64/ARM32）

本项目提供三个GitHubActions工作流，用于自动拉取、保存并上传Docker镜像，支持以下架构：

- x86-64(amd64)
- ARM64(arm64)
- ARM32(arm/v7)

无需本地Docker环境，通过GitHubActions即可自动生成`.tar.gz`离线包，适用于无法联网的服务器环境。

## 🚀功能介绍

### ✔多架构支持
一次仓库满足不同平台(x86/ARM)镜像需求。

### ✔自动生成离线包
每次运行会自动完成：
1.拉取指定架构镜像
2.导出为`.tar`
3.压缩为`.tar.gz`
4.上传至GitHubRelease
5.ActionsArtifact也可下载

### ✔批量下载
支持输入多个镜像名称(英文逗号分隔)：

```
ubuntu:22.04,nginx:latest,redis:7
```

### ✔可选上传到阿里云镜像仓库
若配置以下Secrets则自动推送：

- DOCKER_USERNAME
- DOCKER_PASSWORD
- ALIYUN_REPO_NAMESPACE

未配置则自动跳过推送步骤。

## 📌使用方法

### 1.打开Actions页面
点击仓库顶部的Actions。

### 2.选择对应架构的工作流
- x86-64PullandSaveDockerImage
- ARM64PullandSaveDockerImage
- ARM32PullandSaveDockerImage

### 3.点击“Runworkflow”
输入镜像名称，例如：

```
nginx:latest
```

多个镜像：

```
alpine:latest,busybox:latest
```

### 4.下载离线包
成功完成后可在以下位置获取：
- GitHubReleases
- ActionsArtifact

## 📦离线导入镜像

```bash
tar -xzvf xxx.tar.gz
docker load -i xxx.tar
```

## 🔧可选Secrets说明

| Secret名称 | 用途 |
|-----------|------|
| DOCKER_USERNAME | Docker/阿里云仓库用户名 |
| DOCKER_PASSWORD | 仓库密码 |
| ALIYUN_REPO_NAMESPACE | 推送到阿里云的命名空间 |

## 📁工作流文件结构

```
.github/workflows/
├── x86-64.yml
├── arm64.yml
└── arm32.yml
```

## ⭐示例镜像

```
ubuntu:latest
nginx:stable
mysql:8.0
redis:7
alpine:latest
python:3.10
node:20.12.2-alpine
```

## 📝许可证

本项目使用MITLicense  
©2025zhaoyangpp

## ⭐支持项目

如果本项目对你有帮助，欢迎点Star支持！
