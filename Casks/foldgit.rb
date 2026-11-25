cask "foldgit" do
  version "0.6.0"
  sha256 "a1d6e107edccaa7d898342ec5c43b7911b5e1cea80b2216bc10eb720d78768df"

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
