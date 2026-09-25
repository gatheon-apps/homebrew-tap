cask "filewise" do
  version "0.7.3"
  sha256 "5ebe411f7c9302b4452d6459a1086be9b25d1c6f55d3b0bfbfafb2e98ee94065"

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

  postflight_steps do
    # Install-channel marker for the app's launch telemetry (Telemetry.installChannel), at the
    # same path install.sh writes "curl" to. An existing marker is kept only if the app reads
    # it as "curl": UTF-8 decoding drops one leading BOM, then Foundation's
    # whitespacesAndNewlines is trimmed (listed as UTF-8 bytes because inreplace reads binary).
    # Paths use base: :home because "~" expands to the step sandbox's temporary HOME.
    # write_file also opens the marker's directory to the sandbox, where inreplace creates
    # its temporary file.
    if_path_exists "Library/Application Support/Filewise/install-channel", base: :home do
      inreplace "Library/Application Support/Filewise/install-channel", /
        \A(?!
          (?:\xEF\xBB\xBF)?
          (?<ws>\s|\xC2[\x85\xA0]|\xE1\x9A\x80|\xE2\x80[\x80-\x8B\xA8\xA9\xAF]|\xE2\x81\x9F|\xE3\x80\x80)*
          curl \g<ws>* \z
        ).*
      /mnx, "brew", base: :home, audit_result: false
    end
    write_file "Library/Application Support/Filewise/install-channel", "brew", base: :home, overwrite: false
  end

  zap trash: [
    "~/Library/Application Support/Filewise",
    "~/Library/Caches/fyi.jiang.guiwei",
    "~/Library/Preferences/fyi.jiang.guiwei.plist",
    "~/Library/Saved Application State/fyi.jiang.guiwei.savedState",
  ]
end
