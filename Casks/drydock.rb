cask "drydock" do
  version "0.8.0"
  sha256 "2a8140419a054c8d748d3dfcf57a73cc2779689a616959f105f395b2401b2057"

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
