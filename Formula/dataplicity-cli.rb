class DataplicityCli < Formula
  desc "Dataplicity CLI (OEM/developer workflows)"
  homepage "https://github.com/wildfoundry/dataplicity-cli"
  url "https://github.com/wildfoundry/dataplicity-cli/releases/download/v0.1.4/dataplicity-cli-0.1.4-macos-universal2.tar.gz"
  sha256 "609b4def6eebdaaf8371855dfb9c1565aae8b7bd7a755340af6ec33270940029"
  version "0.1.4"
  license "MIT"

  def install
    odie "This formula currently supports macOS only." unless OS.mac?
    bin.install "dataplicity"
  end

  test do
    system "#{bin}/dataplicity", "--help"
  end
end

