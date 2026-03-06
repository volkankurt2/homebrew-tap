cask "openrouter-menubar" do
  version "1.0.8"
  sha256 "ea4948e30d75b2930a1f8156403dacaa4868084df419f378819167a55930a868"

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
