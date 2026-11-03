cask "foldgit" do
  version "0.4.0"
  sha256 "c14cd829c2571f7b2a46e921de293a6468ffd54e8c86340d61f3b8f03f3c8950"

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
