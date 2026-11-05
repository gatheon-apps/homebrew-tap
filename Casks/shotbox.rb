cask "shotbox" do
  version "0.12.2"
  sha256 "ce33390bc8522965dbce2fdcac877d8d72d62604c915246dfe6c6864132e1024"

  url "https://dl-box.gatheon.com/Shotbox-#{version}.dmg"
  name "Shotbox"
  desc "Auto-titles screenshots and indexes their text for search"
  homepage "https://box.gatheon.com/"

  livecheck do
    url "https://dl-box.gatheon.com/appcast.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :ventura

  app "Shotbox.app"

  zap trash: [
    "~/Library/Application Support/Shotbox",
    "~/Library/Caches/fyi.jiang.shotbox",
    "~/Library/Preferences/fyi.jiang.shotbox.plist",
  ]
end
