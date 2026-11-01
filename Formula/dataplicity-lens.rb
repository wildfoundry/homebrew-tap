# typed: strict
# frozen_string_literal: true

# Installs the complete Dataplicity Lens command suite.
class DataplicityLens < Formula
  desc "System operations toolkit for Linux and macOS"
  homepage "https://lens.dataplicity.com/"
  version "0.3.8"
  license "Apache-2.0"
  depends_on :macos

  on_macos do
    on_arm do
      url "https://github.com/wildfoundry/dataplicity-lens/releases/download/v0.3.8/dataplicity-lens-v0.3.8-aarch64-apple-darwin.tar.gz"
      sha256 "541a9a6f6c1608e9cae1e17dc86a59a701130e1fd01c7f4f8bdab1ad9ade19a7"
    end
    on_intel do
      url "https://github.com/wildfoundry/dataplicity-lens/releases/download/v0.3.8/dataplicity-lens-v0.3.8-x86_64-apple-darwin.tar.gz"
      sha256 "d8293911db9d0f357eb222117a9f16a67f1dbc137a69cbc59de57e1bf6c3caa1"
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
