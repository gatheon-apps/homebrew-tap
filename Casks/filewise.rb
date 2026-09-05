cask "filewise" do
  version "0.6.0"
  sha256 "2b45031667b03dc826e65e4f062a7a2c22449005ef74b1ff97361cd05f521938"

  url "https://dl-filewise.gatheon.com/Filewise_v#{version}_slim.dmg"
  name "Filewise"
  desc "Content-aware file organizer that renames and sorts documents"
  homepage "https://filewise.gatheon.com/"

  livecheck do
    url "https://dl-filewise.gatheon.com/appcast-slim.xml"
    strategy :sparkle
  end

  auto_updates true
  depends_on macos: :sonoma

  app "Filewise.app"

  zap trash: [
    "~/Library/Application Support/Filewise",
    "~/Library/Caches/fyi.jiang.guiwei",
    "~/Library/Preferences/fyi.jiang.guiwei.plist",
    "~/Library/Saved Application State/fyi.jiang.guiwei.savedState",
  ]
end
