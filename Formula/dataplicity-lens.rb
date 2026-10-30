# typed: strict
# frozen_string_literal: true

# Installs the complete Dataplicity Lens command suite.
class DataplicityLens < Formula
  desc "System operations toolkit for Linux and macOS"
  homepage "https://lens.dataplicity.com/"
  version "0.3.7"
  license "Apache-2.0"
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/wildfoundry/dataplicity-lens/releases/download/v0.3.7/dataplicity-lens-v0.3.7-aarch64-apple-darwin.tar.gz"
      sha256 "6f72718956d60fc12d511a25cf8b0fc4522e250733f47be7a98c22489a9890cb"
    end
    on_intel do
      url "https://github.com/wildfoundry/dataplicity-lens/releases/download/v0.3.7/dataplicity-lens-v0.3.7-x86_64-apple-darwin.tar.gz"
      sha256 "dbeba028c8f0ec1d51a04b5bd7596ed2dfe400688e158c6a01a151863933f802"
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
