# Homebrew Tap

用于发布 [@dufu1991](https://github.com/dufu1991) 的 Homebrew 软件仓库。

## 安装 Tap

```bash
brew tap dufu1991/tap
```

## 可用 Cask

### [youran-toolbox](https://github.com/dufu1991/youran-toolbox)

轻量、跨平台、隐私优先的离线桌面工具箱。

```bash
brew install --cask dufu1991/tap/youran-toolbox
```

> 当前仅提供 Apple Silicon ( arm64 ) 的 macOS 安装包。

## 更新

```bash
brew update
brew upgrade --cask dufu1991/tap/youran-toolbox
```

## 卸载

```bash
brew uninstall --cask dufu1991/tap/youran-toolbox
brew untap dufu1991/tap
```

## 自动更新 Cask

本仓库已包含 `.github/workflows/bump.yml`，可通过 `repository_dispatch` 自动更新版本号与 `sha256`。
