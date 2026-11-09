cask "foldgit" do
  version "0.5.1"
  sha256 "2a4e4b65a747125fae144b0c03757d681342f3aaf71e0f1347e0664dea9587f0"

  url "https://github.com/dufu1991/foldgit/releases/download/v#{version}/FoldGit-macOS-arm64.dmg"
  name "FoldGit"
  desc "Native, lightweight Git client with grouped repositories and worktrees"
  homepage "https://github.com/dufu1991/foldgit"

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
      https://github.com/dufu1991/foldgit#install
  EOS
end
