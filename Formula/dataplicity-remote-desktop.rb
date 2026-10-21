# typed: false
# frozen_string_literal: true

class DataplicityRemoteDesktop < Formula
  desc "Dataplicity remote desktop host"
  homepage "https://github.com/wildfoundry/dataplicity-remote-desktop-releases"
  url "https://github.com/wildfoundry/dataplicity-remote-desktop-releases/releases/download/v0.1.17/dataplicity-remote-desktop-0.1.17-macos-universal2.tar.gz"
  sha256 "d6df467166a1142e573edc6043eda095f0fbf1e975d43417acd121e88a17a4d0"
  version "0.1.17"
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
