cask "drydock" do
  version "1.1.2"
  sha256 "093ea0e09412b3b899e4531041c20eee97533acb7a6cf1880d34dd1886e2b0cd"

  url "https://github.com/xd00099/drydock/releases/download/v#{version}/Drydock_#{version}_aarch64.dmg"
  name "Drydock"
  desc "Home port for your Claude Code sessions — search, radar, resume"
  homepage "https://github.com/xd00099/drydock"

  depends_on arch: :arm64

  app "Drydock.app"

  zap trash: [
    "~/Library/Application Support/com.drydock.app",
  ]

  caveats <<~EOS
    Drydock is not signed with an Apple Developer ID yet, so macOS
    reports the quarantined app as "damaged". Clear the flag with:

      xattr -dr com.apple.quarantine "#{appdir}/Drydock.app"

    or install with:  brew install --cask drydock --no-quarantine
  EOS
end
