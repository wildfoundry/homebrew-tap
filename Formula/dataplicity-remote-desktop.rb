# typed: false
# frozen_string_literal: true

class DataplicityRemoteDesktop < Formula
  desc "Dataplicity remote desktop host"
  homepage "https://github.com/wildfoundry/dataplicity-remote-desktop-releases"
  url "https://github.com/wildfoundry/dataplicity-remote-desktop-releases/releases/download/v0.1.8/dataplicity-remote-desktop-0.1.8-macos-universal2.tar.gz"
  sha256 "1a34728994b072e2cdf99dd3bc19993594700bafa549e31bd429592620fda7e2"
  version "0.1.8"
  license :cannot_represent

  def install
    odie "This formula currently supports macOS only." unless OS.mac?
    bin.install "dataplicity-rd"
  end

  test do
    system "#{bin}/dataplicity-rd", "--help"
  end
end
