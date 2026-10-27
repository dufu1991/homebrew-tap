cask "norna-studio" do
  version "0.1.1,9"
  sha256 "b975c39758008eb8867ea3f001002989ac113f140043c49a410ed81d062758a4"

  url "https://github.com/dufu1991/nornakit/releases/download/v0.2.0/Norna-Studio-macOS-arm64.dmg"
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
