class DataplicityCli < Formula
  desc "Dataplicity CLI (OEM/developer workflows)"
  homepage "https://github.com/wildfoundry/dataplicity-cli"
  url "https://github.com/wildfoundry/dataplicity-cli/releases/download/v0.1.6/dataplicity-cli-0.1.6-macos-universal2.tar.gz"
  sha256 "5c32ef7fd97572b7b546035422f2b56bfd5cf2444a79dce72248ac64df97209e"
  version "0.1.6"
  license "BSD-3-Clause"

  def install
    odie "This formula currently supports macOS only." unless OS.mac?
    bin.install "dataplicity"
  end

  test do
    system "#{bin}/dataplicity", "--help"
  end
end
