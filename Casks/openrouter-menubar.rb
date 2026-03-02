cask "openrouter-menubar" do
  version "1.0.2"
  sha256 "1b84e34909a8bae28a96ddcf829f982ea334c78fef022bf1c9ee6d9099b04b54"

  url "https://github.com/volkankurt2/openrouter-menubar/releases/download/v#{version}/OpenRouter.Balance-#{version}-arm64.dmg"
  name "OpenRouter Menubar"
  desc "A menubar app to monitor and switch OpenRouter API keys"
  homepage "https://github.com/volkankurt2/openrouter-menubar"

  app "OpenRouter Balance.app"

  postflight do
    system_command "xattr",
                   args: ["-cr", "#{appdir}/OpenRouter Balance.app"],
                   sudo: true,
                   print_stderr: false
  end

  zap trash: [
    "~/Library/Application Support/openrouter-menubar",
    "~/Library/Preferences/com.openrouter.menubar.plist",
  ]
end
