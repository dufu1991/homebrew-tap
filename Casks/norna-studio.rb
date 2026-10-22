cask "norna-studio" do
  version "0.1.1,7"
  sha256 "1738f08a418a2fbcf079a2b27d71db18e9256d6eb18429974d1834f99700f8cf"

  url "https://github.com/dufu1991/nornakit/releases/download/v0.1.0/Norna-Studio-macOS-arm64.dmg"
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
