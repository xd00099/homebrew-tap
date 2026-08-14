cask "drydock" do
  version "0.7.1"
  sha256 "5e13e72b9d2379adf57fbd2b27ac9ca13d0247c890d1fcfda7e66f6db9259ee9"

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
