cask "openrouter-menubar" do
  version "1.0.7"
  sha256 "19c4241a902697d01fc0255b8c1bf2f4cfd60ba0db4c67c978ee833b7bd51d44"

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
