cask "shotbox" do
  version "0.12.0"
  sha256 "589a21234ef9e826429ae05e32680f7e9a3281cfd9a6db5c8bd1ae6a4f646775"

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
