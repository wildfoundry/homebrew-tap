# typed: strict
# frozen_string_literal: true

# Installs the complete Dataplicity Lens command suite.
class DataplicityLens < Formula
  desc "System operations toolkit for Linux and macOS"
  homepage "https://lens.dataplicity.com/"
  version "0.3.0"
  license "Apache-2.0"
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/wildfoundry/dataplicity-lens/releases/download/v0.3.0/dataplicity-lens-v0.3.0-aarch64-apple-darwin.tar.gz"
      sha256 "1f1d801536eac69facd308d1a012209fd3f644d8ec185f88d1ec96fe9fa05602"
    end
    on_intel do
      url "https://github.com/wildfoundry/dataplicity-lens/releases/download/v0.3.0/dataplicity-lens-v0.3.0-x86_64-apple-darwin.tar.gz"
      sha256 "a61467d1aa801b3f6e9b85e5dafc76a4dc5ac40c0edc4a7483b912aa4b4d0a3a"
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
