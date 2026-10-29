# dufu's Homebrew Tap

[English](README.md) · [简体中文](README.zh-CN.md)

Install and update desktop apps maintained by [dufu](https://github.com/dufu1991) with Homebrew. This tap currently provides three Casks for Apple Silicon Macs.

## App overview

<table>
  <thead>
    <tr>
      <th width="80" align="center">Icon</th>
      <th width="140" align="left">Name</th>
      <th width="160" align="left">Links</th>
      <th align="left">Description</th>
    </tr>
  </thead>
  <tbody>
    <tr>
      <td width="80" align="center">
        <picture>
          <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/dufu1991/foldgit/main/Shared/Resources/Branding/Images/FoldGit-dark.png">
          <img src="https://raw.githubusercontent.com/dufu1991/foldgit/main/Shared/Resources/Branding/Images/FoldGit.png" width="48" alt="FoldGit app icon">
        </picture>
      </td>
      <td><a href="#foldgit"><strong>FoldGit</strong></a></td>
      <td><a href="https://foldgit.com">Website</a> · <a href="https://github.com/dufu1991/foldgit">Source</a></td>
      <td>A native, lightweight Git client with repository groups, worktree management, directory trees and diff staging.</td>
    </tr>
    <tr>
      <td width="80" align="center">
        <picture>
          <source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/dufu1991/nornakit/main/website/dist/assets/brand/app-icon-dark.png">
          <img src="https://raw.githubusercontent.com/dufu1991/nornakit/main/website/dist/assets/brand/app-icon-light.png" width="48" alt="Norna Studio app icon">
        </picture>
      </td>
      <td><a href="#norna-studio"><strong>Norna Studio</strong></a></td>
      <td><a href="https://nornakit.com">Website</a> · <a href="https://github.com/dufu1991/nornakit">Source</a></td>
      <td>NornaKit's native diagram workbench for demonstrating and debugging Mermaid rendering, with image, SVG and PDF export.</td>
    </tr>
    <tr>
      <td width="80" align="center"><img src="https://youran-toolbox.du-fu.com/logo.png" width="48" alt="YouranToolbox app icon"></td>
      <td><a href="#youran-toolbox"><strong>YouranToolbox</strong></a></td>
      <td><a href="https://youran-toolbox.du-fu.com">Website</a> · <a href="https://github.com/dufu1991/youran-toolbox">Source</a></td>
      <td>A privacy-first desktop toolbox for local file, text, image, data and developer tasks.</td>
    </tr>
  </tbody>
</table>

## Installation

Install [Homebrew](https://brew.sh/), then choose the apps you want to install. Using a fully qualified name automatically adds this tap.

```sh
brew install --cask dufu1991/tap/foldgit
brew install --cask dufu1991/tap/norna-studio
brew install --cask dufu1991/tap/youran-toolbox
```

You can also add the tap separately and install apps later:

```sh
brew tap dufu1991/tap
```

## App details

### FoldGit

<picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/dufu1991/foldgit/main/Shared/Resources/Branding/Images/FoldGit-dark.png"><img src="https://raw.githubusercontent.com/dufu1991/foldgit/main/Shared/Resources/Branding/Images/FoldGit.png" width="80" alt="FoldGit app icon"></picture>

**Requirements: macOS 26 or later, an Apple Silicon Mac, and Git.**

Organize repositories by folder or group in one window, with linked worktrees nested under their repository. Review the commit graph, browse directory trees, switch between unified and side-by-side diffs, and stage changes by directory, file or hunk.

If Git is not installed, run `xcode-select --install` first.

[User guide](https://foldgit.com/manual) · [Source](https://github.com/dufu1991/foldgit) · [Releases and downloads](https://github.com/dufu1991/foldgit/releases)

### Norna Studio

<picture><source media="(prefers-color-scheme: dark)" srcset="https://raw.githubusercontent.com/dufu1991/nornakit/main/website/dist/assets/brand/app-icon-dark.png"><img src="https://raw.githubusercontent.com/dufu1991/nornakit/main/website/dist/assets/brand/app-icon-light.png" width="80" alt="Norna Studio app icon"></picture>

**Requirements: macOS 14 or later and an Apple Silicon Mac.**

NornaKit's companion diagram workbench provides Mermaid source editing, live previews, canvas panning and zooming, and Chinese and English interfaces. Use it to explore native rendering, reproduce diagram issues, and export diagrams as images, SVG or PDF.

This Cask installs the Norna Studio app. To integrate the NornaKit rendering library into your project, follow the project's Swift Package Manager instructions. The library does not require the workbench.

[User guide](https://github.com/dufu1991/nornakit/blob/main/Docs/GUIDE.md) · [Source and rendering library](https://github.com/dufu1991/nornakit) · [Releases and downloads](https://github.com/dufu1991/nornakit/releases)

<a id="youran-toolbox"></a>
<a id="悠然工具箱"></a>

### YouranToolbox

<img src="https://youran-toolbox.du-fu.com/logo.png" width="80" alt="YouranToolbox app icon">

**Requirements: an Apple Silicon Mac.**

YouranToolbox brings common office and developer utilities into one desktop app, including batch renaming, PDF tools, text comparison, image conversion, QR codes, JSON formatting, and encoding and decoding. Tool input is processed locally and is never uploaded. The app supports tool search, light and dark appearances, and multiple interface languages.

This tap distributes the macOS app. See the project documentation for Windows installers and support for other platforms.

[Features and user guide](https://youran-toolbox.du-fu.com) · [Project documentation](https://github.com/dufu1991/youran-toolbox/blob/main/README.md) · [Source](https://github.com/dufu1991/youran-toolbox) · [Releases and downloads](https://github.com/dufu1991/youran-toolbox/releases)

## First launch

See each release's notes for its signing and Apple notarization status. If macOS reports that an app is damaged or its developer cannot be verified, first confirm that the installer came from the official project and release page above. Then run the command for that app if needed.

| App | Command for the default installation path |
| --- | --- |
| FoldGit | `xattr -dr com.apple.quarantine /Applications/FoldGit.app` |
| Norna Studio | `xattr -dr com.apple.quarantine "/Applications/Norna Studio.app"` |
| YouranToolbox | `xattr -dr com.apple.quarantine /Applications/YouranToolbox.app` |

Open the app again afterwards. Adjust the path if you installed it elsewhere. See each project's documentation for more installation details.

## Updates and removal

Refresh Homebrew, then upgrade an installed app. Replace `foldgit` with `norna-studio` or `youran-toolbox` as needed.

```sh
brew update
brew upgrade --cask dufu1991/tap/foldgit
```

View app information or uninstall it:

```sh
brew info --cask dufu1991/tap/foldgit
brew uninstall --cask dufu1991/tap/foldgit
```

Remove the tap when you no longer use it:

```sh
brew untap dufu1991/tap
```

## Maintenance and release synchronization

| App | Automatic synchronization | Workflow |
| --- | --- | --- |
| FoldGit | Checks the latest stable release every 6 hours, downloads the macOS DMG, and verifies its size and GitHub SHA-256 digest before updating the Cask. | [Sync FoldGit](https://github.com/dufu1991/homebrew-tap/actions/workflows/foldgit.yml) |
| Norna Studio | Checks for a Studio companion in the latest stable release every 6 hours. Verifies release metadata, asset digests and the downloaded package. Supports both Kit and standalone Studio releases. | [Sync Norna Studio](https://github.com/dufu1991/homebrew-tap/actions/workflows/norna-studio.yml) |
| YouranToolbox | Updates the Cask version and SHA-256 from a `youran_toolbox_release_published` release event. | [Bump youran-toolbox](https://github.com/dufu1991/homebrew-tap/actions/workflows/bump.yml), triggered by a release event. |

The scheduled FoldGit and Norna Studio jobs use this repository's own `GITHUB_TOKEN`; no personal access token is required. GitHub scheduling may delay a run. To synchronize immediately or retry, click **Run workflow** on the corresponding workflow page. YouranToolbox uses release events and has no polling schedule.

Rebuilt FoldGit packages refresh the checksum even for the same version; unchanged versions and checksums do not create commits. Norna Studio maintains its app version separately from the NornaKit library. Its Cask uses the Studio version and build number in the release metadata. See the [NornaKit release guide](https://github.com/dufu1991/nornakit/blob/main/Docs/RELEASING.md) for details.

Cask definitions are in [`Casks/`](Casks), and synchronization workflows are in [`.github/workflows/`](.github/workflows). To validate FoldGit's release verification script:

```sh
python3 -m unittest discover -s Tests -p 'test_sync_foldgit.py'
```
