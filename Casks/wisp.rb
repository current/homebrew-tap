cask "wisp" do
  version "0.4.0"
  sha256 "4449a233093dc235fd5a90b266344bc8976d1d8fde102dac190dcfe2c3ae602d"

  url "https://github.com/current/wisp/releases/download/v#{version}/Wisp-#{version}.zip"
  name "Wisp"
  desc "System monitor that groups processes by app"
  homepage "https://wisp-mac.com/"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia

  app "Wisp.app"
  binary "#{appdir}/Wisp.app/Contents/Helpers/wisp"

  # Wisp is signed ad hoc, not notarized. Without this, macOS refuses the first launch
  # until you click Open Anyway in System Settings > Privacy & Security.
  postflight_steps do
    run "/usr/bin/xattr", args: ["-dr", "com.apple.quarantine", "{{appdir}}/Wisp.app"], must_succeed: false
  end

  uninstall quit: "app.wisp.Wisp"

  zap trash: [
    "~/Library/Application Support/Wisp",
    "~/Library/Preferences/app.wisp.Wisp.plist",
  ]

  caveats <<~EOS
    Wisp is not notarized. This cask removed the quarantine flag from
    #{appdir}/Wisp.app so macOS opens it without asking. To check the download
    yourself, compare the SHA-256 on the release page:
      https://github.com/current/wisp/releases/tag/v#{version}
  EOS
end
