cask "norna-studio" do
  version "0.1.1,8"
  sha256 "82f812ff2c42924c4983725d9e99aeafd3c2b32dd3aa269d29df251961f945c0"

  url "https://github.com/dufu1991/nornakit/releases/download/v0.1.1/Norna-Studio-macOS-arm64.dmg"
  name "Norna Studio"
  desc "Companion demo, debugging, and export tool for the NornaKit diagram library"
  homepage "https://nornakit.com"

  livecheck do
    skip "Updated from the verified companion manifest by GitHub Actions."
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Norna Studio.app"

  caveats <<~EOS
    This build is ad-hoc signed and is not notarized by Apple.
    macOS Gatekeeper may block it. See the release notes before opening the app.
  EOS
end
