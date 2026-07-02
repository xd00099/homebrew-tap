cask "drydock" do
  version "0.1.0"
  sha256 "638db5811e9019dc132cd4169cf90c97dd33b2f6fef2582ff64774eb70f826b5"

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
    Drydock is not signed with an Apple Developer ID yet. If macOS
    refuses to open it, install with --no-quarantine, or approve it
    under System Settings → Privacy & Security → Open Anyway.
  EOS
end
