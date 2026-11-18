class DataplicityCli < Formula
  desc "Dataplicity CLI (OEM/developer workflows)"
  homepage "https://github.com/wildfoundry/dataplicity-cli"
  url "https://github.com/wildfoundry/dataplicity-cli/releases/download/v0.2.1/dataplicity-cli-0.2.1-macos-universal2.tar.gz"
  sha256 "aa14ee1c07ac6609e3ee90d64554a38507c55c9cfd14fefeef0ae6d362d01e29"
  version "0.2.1"
  license "BSD-3-Clause"

  def install
    odie "This formula currently supports macOS only." unless OS.mac?
    bin.install "dataplicity"
  end

  test do
    system "#{bin}/dataplicity", "--help"
  end
end
