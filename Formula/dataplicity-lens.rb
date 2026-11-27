# typed: strict
# frozen_string_literal: true

# Installs the complete Dataplicity Lens command suite.
class DataplicityLens < Formula
  desc "System operations toolkit for Linux and macOS"
  homepage "https://lens.dataplicity.com/"
  version "0.3.12"
  license "Apache-2.0"
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/wildfoundry/dataplicity-lens/releases/download/v0.3.12/dataplicity-lens-v0.3.12-aarch64-apple-darwin.tar.gz"
      sha256 "a7d8b68fd0e672fe99db47b14686f949dc2afc0e2b3581d67edcd2d77d2a7eff"
    end
    on_intel do
      url "https://github.com/wildfoundry/dataplicity-lens/releases/download/v0.3.12/dataplicity-lens-v0.3.12-x86_64-apple-darwin.tar.gz"
      sha256 "b46a6a03eeb3792dbf5cf976a2578c19e6adfd63cf642f412c9881d73c8f08fd"
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
