# typed: false
# frozen_string_literal: true

class DataplicityRemoteDesktop < Formula
  desc "Dataplicity remote desktop host"
  homepage "https://github.com/wildfoundry/dataplicity-remote-desktop-releases"
  url "https://github.com/wildfoundry/dataplicity-remote-desktop-releases/releases/download/v0.1.9/dataplicity-remote-desktop-0.1.9-macos-universal2.tar.gz"
  sha256 "8f7e257fd02a35e2e168f3fb4c5a13416c2f1b589613b44024432c81ec5dae05"
  version "0.1.9"
  license :cannot_represent

  def install
    odie "This formula currently supports macOS only." unless OS.mac?
    bin.install "dataplicity-rd"
  end

  test do
    system "#{bin}/dataplicity-rd", "--help"
  end
end
