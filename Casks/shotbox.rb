cask "shotbox" do
  version "0.9.2"
  sha256 "c5287cae5bc96df80513cf655d780f1b3fa749a74ed6cb96088a6211dc296008"

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
