cask "drydock" do
  version "0.3.0"
  sha256 "d1c13c3c0d38ab2a58434d14a4b53bab69ddf7e562b443dc2ba4fc9b7407db21"

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
