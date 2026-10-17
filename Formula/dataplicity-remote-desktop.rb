class DataplicityRemoteDesktop < Formula
  desc "Dataplicity remote desktop host (internal)"
  homepage "https://github.com/wildfoundry/dataplicity-remote-desktop"
  url "https://github.com/wildfoundry/dataplicity-remote-desktop/releases/download/v0.1.3/dataplicity-remote-desktop-0.1.3-macos-universal2.tar.gz"
  sha256 "066d7344a30c5c97f38dfa28acc9305fc7e05b530834f5a32acb57eb67db45ac"
  version "0.1.3"
  license :cannot_represent

  def install
    odie "This formula currently supports macOS only." unless OS.mac?
    bin.install "dataplicity-rd"
  end

  test do
    system "#{bin}/dataplicity-rd", "--help"
  end
end
