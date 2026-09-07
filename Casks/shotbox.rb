cask "shotbox" do
  version "0.9.3"
  sha256 "de02e5e2b88640cee0d09917f197973505c1d59ad51e94f865f179a86ffecdae"

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
