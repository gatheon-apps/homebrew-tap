cask "shotbox" do
  version "0.9.4"
  sha256 "80a14bd5c8571e6263257f3bc650ef6c412a68e947c491ba30fc19fc325c2349"

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
