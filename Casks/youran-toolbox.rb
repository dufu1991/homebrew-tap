cask "youran-toolbox" do
  version "0.1.1"
  sha256 "11566a05c3cd7bf5d097f5498d9b92e82d32d7525dd1407919fb6e65f698aa26"

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
