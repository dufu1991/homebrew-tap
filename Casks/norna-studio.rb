cask "norna-studio" do
  version "0.1.0"
  sha256 "7c3ed12246904bb852b21d9ea541a194847f198bbc3da2b6e759e002333c41a5"

  url "https://github.com/dufu1991/norna/releases/download/studio-v#{version}/Norna-Studio-macOS-universal.dmg"
  name "Norna Studio"
  desc "Companion demo, debugging, and export tool for the NornaKit diagram library"
  homepage "https://github.com/dufu1991/norna"

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
