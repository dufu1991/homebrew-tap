cask "youran-toolbox" do
  version "0.1.4"
  sha256 "affca980aaecc66ce23bddb25329306ace9964858827ba6b2fe6cf39db52a968"

  url "https://github.com/dufu1991/youran-toolbox/releases/download/v#{version}/YouranToolbox_#{version}_aarch64.dmg",
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

  app "YouranToolbox.app"

  zap trash: [
    "~/Library/Application Support/com.youran.toolbox",
    "~/Library/Preferences/com.youran.toolbox.plist",
    "~/Library/Saved Application State/com.youran.toolbox.savedState",
  ]
end
