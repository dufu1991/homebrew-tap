# Homebrew Tap

用于发布 [@dufu1991](https://github.com/dufu1991) 的 Homebrew 软件仓库。

## 安装 Tap

```bash
brew tap dufu1991/tap
```

## 可用 Cask

### [Norna Studio](https://nornakit.com)

NornaKit 以纯 Swift 图表渲染库 **NornaKit** 为核心。Norna Studio 是配套的 Mac 演示与调试工具，用于展示渲染效果、临时渲染 Mermaid 源码、复现问题及导出图片、SVG 或 PDF。渲染库通过 Swift Package Manager 集成，无须安装工作台。

要求 macOS 14 或更高版本，仅支持 Apple Silicon Mac。

```bash
brew install --cask dufu1991/tap/norna-studio
```

#### 首次打开说明

当前版本尚无 Developer ID 签名与 Apple 公证。若 macOS 提示无法验证开发者或无法打开应用，请先确认安装包来自 [NornaKit 的 GitHub Releases](https://github.com/dufu1991/nornakit/releases)，且你信任该应用，然后在终端执行：

```bash
xattr -dr com.apple.quarantine "/Applications/Norna Studio.app"
```

执行后重新打开 Norna Studio。安装位置不同时，请替换为实际路径；该命令只移除下载隔离属性，不能修复实际损坏的文件。详细说明见 [NornaKit 项目文档](https://github.com/dufu1991/nornakit/blob/main/README.zh-CN.md)。

### [悠然工具箱](https://github.com/dufu1991/youran-toolbox)

<img src="https://youran-toolbox.du-fu.com/logo.png" alt="悠然工具箱 Logo" width="140" />

轻量、跨平台、隐私优先的离线桌面工具箱。

```bash
brew install --cask dufu1991/tap/youran-toolbox
```

#### 首次运行说明（未签名版本）

由于当前 macOS 安装包未签名，首次运行前需要执行以下命令移除隔离属性：

```bash
xattr -dr com.apple.quarantine "/Applications/YouranToolbox.app"
```

执行后即可正常打开「悠然工具箱」。

> 当前仅提供 Apple Silicon ( arm64 ) 的 macOS 安装包。

## 更新

```bash
brew update
brew upgrade --cask dufu1991/tap/youran-toolbox
brew upgrade --cask dufu1991/tap/norna-studio
```

## 卸载

```bash
brew uninstall --cask dufu1991/tap/youran-toolbox
brew uninstall --cask dufu1991/tap/norna-studio
brew untap dufu1991/tap
```

## 自动更新 Cask

- 悠然工具箱使用本仓库的 `.github/workflows/bump.yml`，通过 `repository_dispatch` 更新版本号与 `sha256`。
- Norna Studio 由 [NornaKit 仓库的 Homebrew 工作流](https://github.com/dufu1991/nornakit/blob/main/.github/workflows/homebrew.yml) 在发布成功后更新 `Casks/norna-studio.rb`。Kit 的 `vX.Y.Z` 发布通常附带跟随更新的工作台；应用专属更新仍可使用 `studio-vX.Y.Z`。Cask 从发布说明中隐藏的元数据读取独立的 Studio 版本与构建号，例如 `0.1.1,8`，下载地址使用实际承载附件的版本标签。发布页只保留 DMG 附件，工作流会核对元数据、GitHub 附件与下载文件的 SHA-256 校验值。
- 本仓库的 `.github/workflows/norna-studio.yml` 每小时检查最新稳定 Release 中的工作台附件，兼容 Kit 主发布与独立 Studio 发布，使用本仓库自己的 `GITHUB_TOKEN` 同步 Cask，无须个人令牌。也可以在 Actions 中手动运行“Sync Norna Studio”。
- 如需在 NornaKit 发布完成后立即跨仓库同步，可在 NornaKit 仓库选配对本 tap 具有 Contents 读写权限的 `HOMEBREW_TAP_TOKEN`。未配置时，仍由本仓库的同步工作流发布。配置与重试说明见 [NornaKit 发布指南](https://github.com/dufu1991/nornakit/blob/main/Docs/RELEASING.md)。
