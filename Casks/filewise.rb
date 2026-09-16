cask "filewise" do
  version "0.7.0"
  sha256 "2eb02b4554c1355dd51358ac1c328989fcee87c96ca1074d215f22c1e4e88179"

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
