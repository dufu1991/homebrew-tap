cask "norna-studio" do
  version "0.1.1"
  sha256 "7b832bf3ae60fed232e44de54c95a6edf4507bd5e8aa3034466949e7ce478107"

  url "https://github.com/dufu1991/nornakit/releases/download/studio-v#{version}/Norna-Studio-macOS-arm64.dmg"
  name "Norna Studio"
  desc "Companion demo, debugging, and export tool for the NornaKit diagram library"
  homepage "https://nornakit.com"

  livecheck do
    url :url
    regex(/^studio-v(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sonoma

  app "Norna Studio.app"

  caveats <<~EOS
    This build is ad-hoc signed and is not notarized by Apple.
    macOS Gatekeeper may block it. See the release notes before opening the app.
  EOS
end
