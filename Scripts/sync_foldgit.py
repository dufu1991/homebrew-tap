#!/usr/bin/env python3
"""Generate the FoldGit Cask from a verified stable GitHub release."""

import hashlib
import json
import re
import subprocess
import tempfile
from pathlib import Path


REPOSITORY = "dufu1991/foldgit"
ASSET_NAME = "FoldGit-macOS-arm64.dmg"
ROOT = Path(__file__).resolve().parents[1]


def release_package(release):
    tag = release["tag_name"]
    if release["draft"] or release["prerelease"] or not re.fullmatch(
        r"v(0|[1-9]\d*)\.(0|[1-9]\d*)\.(0|[1-9]\d*)", tag
    ):
        raise ValueError("Expected a stable vX.Y.Z release")

    assets = [asset for asset in release["assets"] if asset["name"] == ASSET_NAME]
    if len(assets) != 1:
        raise ValueError("Expected exactly one macOS Apple Silicon DMG")
    asset = assets[0]
    expected_url = f"https://github.com/{REPOSITORY}/releases/download/{tag}/{ASSET_NAME}"
    if asset["browser_download_url"] != expected_url:
        raise ValueError("Unexpected macOS download URL")
    if asset["state"] != "uploaded" or asset["size"] <= 0:
        raise ValueError("The macOS package is not fully uploaded")
    if not re.fullmatch(r"sha256:[0-9a-f]{64}", asset["digest"]):
        raise ValueError("Expected a GitHub SHA-256 asset digest")
    return tag, asset


def verify_package(package, asset):
    if package.stat().st_size != asset["size"]:
        raise ValueError("The downloaded package size does not match GitHub")
    checksum = hashlib.sha256(package.read_bytes()).hexdigest()
    if f"sha256:{checksum}" != asset["digest"]:
        raise ValueError("The downloaded package SHA-256 does not match GitHub")
    return checksum


def cask_content(tag, checksum):
    return f'''cask "foldgit" do
  version "{tag[1:]}"
  sha256 "{checksum}"

  url "https://github.com/{REPOSITORY}/releases/download/v#{{version}}/{ASSET_NAME}"
  name "FoldGit"
  desc "Native, lightweight Git client with grouped repositories and worktrees"
  homepage "https://github.com/{REPOSITORY}"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "FoldGit.app"

  caveats <<~EOS
    Builds without Developer ID signing and Apple notarization may be blocked by macOS.
    See the FoldGit installation guide before opening the app:
      https://github.com/{REPOSITORY}#install
  EOS
end
'''


def update_cask(release, destination):
    tag, asset = release_package(release)
    with tempfile.TemporaryDirectory(prefix="foldgit-homebrew-") as directory:
        subprocess.run(
            [
                "gh", "release", "download", tag, "--repo", REPOSITORY,
                "--pattern", ASSET_NAME, "--dir", directory,
            ],
            check=True,
        )
        checksum = verify_package(Path(directory) / ASSET_NAME, asset)
    content = cask_content(tag, checksum)
    if destination.exists() and destination.read_text(encoding="utf-8") == content:
        print(f"FoldGit {tag} is already up to date")
        return False
    destination.write_text(content, encoding="utf-8")
    print(f"Updated {destination.name} to {tag} ({checksum})")
    return True


def main():
    release = json.loads(subprocess.check_output(
        ["gh", "api", f"repos/{REPOSITORY}/releases/latest"], text=True
    ))
    update_cask(release, ROOT / "Casks/foldgit.rb")


if __name__ == "__main__":
    main()
