# dufu 的 Homebrew Tap

通过 Homebrew 安装和更新 [dufu](https://github.com/dufu1991) 维护的桌面应用。当前提供以下 3 个 Cask，均用于安装 Apple Silicon Mac 版本。

## 应用总览

<table>
  <thead>
    <tr>
      <th width="80" align="center">图标</th>
      <th width="140" align="left">名称</th>
      <th width="190" align="left">官网</th>
      <th align="left">简介</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td width="80" align="center">
        <picture>
          <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/dufu1991/foldgit/main/Shared/Resources/Branding/Images/FoldGit-dark.png">
          <img src="https://raw.githubusercontent.com/dufu1991/foldgit/main/Shared/Resources/Branding/Images/FoldGit.png" width="48" alt="FoldGit 应用图标">
        </picture>
      </td>
      <td><a href="#foldgit"><strong>FoldGit</strong></a></td>
      <td><a href="https://foldgit.com">foldgit.com</a></td>
      <td>原生、轻量的 Git 客户端，支持仓库分组、工作树管理、目录树审查和差异暂存。</td>
    </tr>
    <tr>
      <td width="80" align="center">
        <picture>
          <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/dufu1991/nornakit/main/website/dist/assets/brand/app-icon-dark.png">
          <img src="https://raw.githubusercontent.com/dufu1991/nornakit/main/website/dist/assets/brand/app-icon-light.png" width="48" alt="Norna Studio 应用图标">
        </picture>
      </td>
      <td><a href="#norna-studio"><strong>Norna Studio</strong></a></td>
      <td><a href="https://nornakit.com">nornakit.com</a></td>
      <td>NornaKit 的原生图表工作台，用于演示、调试 Mermaid 渲染，并导出图片、SVG 或 PDF。</td>
    </tr>
    <tr>
      <td width="80" align="center"><img src="https://youran-toolbox.du-fu.com/logo.png" width="48" alt="悠然工具箱应用图标"></td>
      <td><a href="#悠然工具箱"><strong>悠然工具箱</strong></a></td>
      <td><a href="https://youran-toolbox.du-fu.com">youran-toolbox.du-fu.com</a></td>
      <td>注重隐私的本地桌面工具箱，覆盖文件、文本、图片、数据处理与开发场景。</td>
    </tr>
  </tbody>
</table>

## 安装

先安装 [Homebrew](https://brew.sh/)，再按需选择以下命令。使用完整包名安装时，Homebrew 会自动添加本 tap。

```sh
brew install --cask dufu1991/tap/foldgit
brew install --cask dufu1991/tap/norna-studio
brew install --cask dufu1991/tap/youran-toolbox
```

也可以单独添加 tap，稍后再安装应用：

```sh
brew tap dufu1991/tap
```

## 应用详情

### FoldGit

**系统要求：macOS 26 或更高版本、Apple Silicon Mac，并已安装 Git。**

将多个仓库按目录或分组收进同一个窗口，关联工作树显示在所属仓库下方。支持提交关系图、目录树、单栏与并排差异，以及按目录、文件或代码块暂存，适合日常开发中的改动审查与提交。

未安装 Git 时，可先运行 `xcode-select --install`。

[使用手册](https://foldgit.com/manual) · [源码](https://github.com/dufu1991/foldgit) · [版本与下载](https://github.com/dufu1991/foldgit/releases)

### Norna Studio

**系统要求：macOS 14 或更高版本、Apple Silicon Mac。**

NornaKit 的配套图表工作台，提供 Mermaid 源码编辑、实时预览、画布平移缩放与中英文界面。用于查看原生渲染效果、复现图表问题，以及将图表导出为图片、SVG 或 PDF。

本 Cask 安装 Norna Studio 应用。需要在项目中集成 NornaKit 渲染库时，请按项目文档通过 Swift Package Manager 接入；使用渲染库无须安装工作台。

[使用指南](https://github.com/dufu1991/nornakit/blob/main/Docs/GUIDE.md) · [源码与渲染库](https://github.com/dufu1991/nornakit) · [版本与下载](https://github.com/dufu1991/nornakit/releases)

### 悠然工具箱

**系统要求：Apple Silicon Mac。**

YouranToolbox 将常见办公与开发工具集中在一个桌面应用中，覆盖批量重命名、PDF 处理、文本对比、图片转换、二维码、JSON 格式化与编码解码等场景。工具输入在本机处理，不会上传；支持工具搜索、亮暗色外观和多种界面语言。

本 tap 分发 macOS 版。Windows 安装包与其他平台的支持情况见项目文档。

[功能与使用说明](https://youran-toolbox.du-fu.com) · [中文文档](https://github.com/dufu1991/youran-toolbox/blob/main/readme/README.zh-CN.md) · [源码](https://github.com/dufu1991/youran-toolbox) · [版本与下载](https://github.com/dufu1991/youran-toolbox/releases)

## 首次打开

各应用的签名与 Apple 公证状态以对应版本的发布说明为准。若 macOS 提示「已损坏」或「无法验证开发者」，先确认安装包来自上方的官方项目及发布页，再按需对相应应用执行一次以下命令。

| 应用 | 默认安装位置对应的命令 |
| --- | --- |
| FoldGit | `xattr -dr com.apple.quarantine /Applications/FoldGit.app` |
| Norna Studio | `xattr -dr com.apple.quarantine "/Applications/Norna Studio.app"` |
| 悠然工具箱 | `xattr -dr com.apple.quarantine /Applications/YouranToolbox.app` |

执行后重新打开应用。安装位置不同时，请替换为实际路径；更多安装说明见各项目的使用文档。

## 更新与卸载

先刷新 Homebrew，再更新已安装的应用。下例中的 `foldgit` 可替换为 `norna-studio` 或 `youran-toolbox`。

```sh
brew update
brew upgrade --cask dufu1991/tap/foldgit
```

查看包信息与卸载应用：

```sh
brew info --cask dufu1991/tap/foldgit
brew uninstall --cask dufu1991/tap/foldgit
```

不再使用本 tap 时，可移除仓库：

```sh
brew untap dufu1991/tap
```

## 维护与版本同步

| 包 | 自动同步方式 | 工作流 |
| --- | --- | --- |
| FoldGit | 每 6 小时检查最新稳定 Release，下载 macOS DMG，校验文件大小和 GitHub 提供的 SHA-256 摘要后更新 Cask。 | [Sync FoldGit](https://github.com/dufu1991/homebrew-tap/actions/workflows/foldgit.yml) |
| Norna Studio | 每 6 小时检查最新稳定 Release 中的工作台附件，校验发布元数据、附件摘要与下载文件后更新 Cask，兼容 Kit 主发布和独立 Studio 发布。 | [Sync Norna Studio](https://github.com/dufu1991/homebrew-tap/actions/workflows/norna-studio.yml) |
| 悠然工具箱 | 通过 `youran_toolbox_release_published` 发布事件，将事件中的版本号与 SHA-256 写入 Cask。 | [Bump youran-toolbox](https://github.com/dufu1991/homebrew-tap/actions/workflows/bump.yml)，由发布事件触发。 |

FoldGit 和 Norna Studio 的定时任务使用本仓库自己的 `GITHUB_TOKEN`，无须配置个人令牌。GitHub 调度繁忙时可能延迟；需要立即同步或重试时，在对应任务页面点击 **Run workflow**。悠然工具箱使用发版事件同步，没有定时轮询。

FoldGit 同一版本重新发布安装包时会刷新校验值，版本和校验值均未变化时不会创建提交。Norna Studio 的应用版本与 NornaKit 库版本分别维护，Cask 根据发布元数据中的 Studio 版本与构建号更新，详细规则见 [NornaKit 发布指南](https://github.com/dufu1991/nornakit/blob/main/Docs/RELEASING.md)。

Cask 定义位于 [`Casks/`](Casks)，同步任务位于 [`.github/workflows/`](.github/workflows)。验证 FoldGit 的发布校验脚本：

```sh
python3 -m unittest discover -s Tests -p 'test_sync_foldgit.py'
```
