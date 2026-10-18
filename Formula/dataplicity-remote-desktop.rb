# typed: false
# frozen_string_literal: true

require_relative "../lib/private_release_download_strategy"

class DataplicityRemoteDesktop < Formula
  desc "Dataplicity remote desktop host (internal)"
  homepage "https://github.com/wildfoundry/dataplicity-remote-desktop"
  url "https://github.com/wildfoundry/dataplicity-remote-desktop/releases/download/v0.1.6/dataplicity-remote-desktop-0.1.6-macos-universal2.tar.gz",
      using: GitHubPrivateRepositoryReleaseDownloadStrategy
  sha256 "003801be67c4fde87a17df5cbaba94e098754f08dc4508c0ec6ee9b04851e6fe"
  version "0.1.6"
  license :cannot_represent

  def install
    odie "This formula currently supports macOS only." unless OS.mac?
    bin.install "dataplicity-rd"
  end

  test do
    system "#{bin}/dataplicity-rd", "--help"
  end
end
