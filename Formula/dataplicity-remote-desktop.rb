# typed: false
# frozen_string_literal: true

class DataplicityRemoteDesktop < Formula
  desc "Dataplicity remote desktop host"
  homepage "https://github.com/wildfoundry/dataplicity-remote-desktop-releases"
  url "https://github.com/wildfoundry/dataplicity-remote-desktop-releases/releases/download/v0.1.10/dataplicity-remote-desktop-0.1.10-macos-universal2.tar.gz"
  sha256 "160dc06e57520e2e0c03a9522b4ae5cd275d460851e6ff5c4cccb2d7f2ba49a4"
  version "0.1.10"
  license :cannot_represent

  def install
    odie "This formula currently supports macOS only." unless OS.mac?
    bin.install "dataplicity-rd"
  end

  test do
    system "#{bin}/dataplicity-rd", "--help"
  end
end
