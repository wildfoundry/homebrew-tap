class DataplicityRemoteDesktop < Formula
  desc "Dataplicity remote desktop host (internal)"
  homepage "https://github.com/wildfoundry/dataplicity-remote-desktop"
  # Placeholder until the first release; update-homebrew-tap rewrites url/sha256/version.
  url "https://github.com/wildfoundry/dataplicity-remote-desktop/releases/download/v0.1.0/dataplicity-remote-desktop-0.1.0-macos-universal2.tar.gz"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  version "0.1.0"
  license :cannot_represent

  def install
    odie "This formula currently supports macOS only." unless OS.mac?
    bin.install "dataplicity-rd"
  end

  test do
    system "#{bin}/dataplicity-rd", "--help"
  end
end
