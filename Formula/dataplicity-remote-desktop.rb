# typed: false
# frozen_string_literal: true

class DataplicityRemoteDesktop < Formula
  desc "Dataplicity remote desktop host"
  homepage "https://github.com/wildfoundry/dataplicity-remote-desktop-releases"
  url "https://github.com/wildfoundry/dataplicity-remote-desktop-releases/releases/download/v0.1.14/dataplicity-remote-desktop-0.1.14-macos-universal2.tar.gz"
  sha256 "a16ab9cb79e8ed2632b596ce24f9fa695f6aa7e0709f957aa56f9f4fea1aac13"
  version "0.1.14"
  license :cannot_represent

  def install
    odie "This formula currently supports macOS only." unless OS.mac?
    bin.install "dataplicity-rd"
  end


  def caveats
    <<~EOS
      After install, enrol this Mac with one command from Add computer:

        export DATAPLICITY_RD_ORG=…
        export DATAPLICITY_RD_TOKEN=…
        export DATAPLICITY_RD_API_BASE=https://api.dataplicity.com
        dataplicity-rd onboard

      That prompts for Screen Recording, registers the host, and installs the
      background service (macOS admin dialog — no sudo typing).
    EOS
  end

  test do
    system "#{bin}/dataplicity-rd", "--help"
  end
end
