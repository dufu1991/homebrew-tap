cask "youran-toolbox" do
  version "0.1.0"
  sha256 "764cf694c499d064f2587329d412c2d032bc03d71587d7e603cd1262e6c2a049"

  url "https://github.com/dufu1991/youran-toolbox/releases/download/v#{version}/youran-toolbox_#{version}_aarch64.dmg",
      verified: "github.com/dufu1991/youran-toolbox/"
  name "youran-toolbox"
  name "悠然工具箱"
  desc "A lightweight, cross-platform, privacy-first desktop toolkit"
  homepage "https://github.com/dufu1991/youran-toolbox"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  auto_updates true

  app "youran-toolbox.app"

  zap trash: [
    "~/Library/Application Support/com.youran.toolbox",
    "~/Library/Preferences/com.youran.toolbox.plist",
    "~/Library/Saved Application State/com.youran.toolbox.savedState",
  ]
end
