cask "foldgit" do
  version "0.1.0"
  sha256 "f638e8203cdcbb5219292a7c4898ca150c795ec5d9b9ed3c4836ce563bf262fb"

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
