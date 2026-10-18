# typed: false
# frozen_string_literal: true

require_relative "../lib/private_release_download_strategy"

class DataplicityRemoteDesktop < Formula
  desc "Dataplicity remote desktop host (internal)"
  homepage "https://github.com/wildfoundry/dataplicity-remote-desktop"
  url "https://github.com/wildfoundry/dataplicity-remote-desktop/releases/download/v0.1.7/dataplicity-remote-desktop-0.1.7-macos-universal2.tar.gz",
      using: GitHubPrivateRepositoryReleaseDownloadStrategy
  sha256 "557982a1fdf222cc1fd506afd33c4ab4ba84c17950e5790e62e1a65ee7f97daa"
  version "0.1.7"
  license :cannot_represent

  def install
    odie "This formula currently supports macOS only." unless OS.mac?
    bin.install "dataplicity-rd"
  end

  test do
    system "#{bin}/dataplicity-rd", "--help"
  end
end
