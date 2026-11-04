# typed: strict
# frozen_string_literal: true

# Installs the complete Dataplicity Lens command suite.
class DataplicityLens < Formula
  desc "System operations toolkit for Linux and macOS"
  homepage "https://lens.dataplicity.com/"
  version "0.3.11"
  license "Apache-2.0"
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/wildfoundry/dataplicity-lens/releases/download/v0.3.11/dataplicity-lens-v0.3.11-aarch64-apple-darwin.tar.gz"
      sha256 "49621705ab1e001d8b1de62eccde45505b91d1d9068f780ae54857c3268c22c4"
    end
    on_intel do
      url "https://github.com/wildfoundry/dataplicity-lens/releases/download/v0.3.11/dataplicity-lens-v0.3.11-x86_64-apple-darwin.tar.gz"
      sha256 "a507398bf0460cb2f6ca08b2d0f6ca5daa190ff5d5a128ef5d8fe8a1620246b8"
    end
  end

  def install
    bin.install Dir["bin/*"]
    man1.install Dir["*.1"]
    bash_completion.install Dir["completions/*.bash"]
    zsh_completion.install Dir["completions/_*"]
    fish_completion.install Dir["completions/*.fish"]
  end

  test do
    output = shell_output("#{bin}/lens-top --demo --json")
    assert_match '"schema_version": "2"', output
    assert_match version.to_s, shell_output("#{bin}/lens-top --version")
  end
end
