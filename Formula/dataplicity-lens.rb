# typed: strict
# frozen_string_literal: true

# Installs the complete Dataplicity Lens command suite.
class DataplicityLens < Formula
  desc "System operations toolkit for Linux and macOS"
  homepage "https://lens.dataplicity.com/"
  version "0.3.6"
  license "Apache-2.0"
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/wildfoundry/dataplicity-lens/releases/download/v0.3.6/dataplicity-lens-v0.3.6-aarch64-apple-darwin.tar.gz"
      sha256 "5cd5b5fa3d10b43a286ebc274ef5296b162205be6e0bec16f8311c2d08ba7b16"
    end
    on_intel do
      url "https://github.com/wildfoundry/dataplicity-lens/releases/download/v0.3.6/dataplicity-lens-v0.3.6-x86_64-apple-darwin.tar.gz"
      sha256 "ad9ba9e15658e66519c40e3ce35354659728bf3e578d8c6263cbf065363d0795"
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
