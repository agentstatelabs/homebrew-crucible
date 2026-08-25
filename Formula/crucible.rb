# Homebrew formula template for the `agentstatelabs/crucible` tap.
# scripts/render-homebrew.sh substitutes the placeholder markers
# (VERSION and per-target SHA256) from a release's SHA256SUMS and
# prints the final .rb.
#
# Artifact URLs point at the PUBLIC releases mirror published from
# .github/workflows/release.yml (agentstatelabs/AgentStateCrucible-releases).

class Crucible < Formula
  desc "Agent testing and validation framework"
  homepage "https://agentstatecrucible.dev"
  version "0.2.6"
  license "BUSL-1.1"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/AgentStateCrucible-releases/releases/download/v0.2.6/crucible-v0.2.6-aarch64-apple-darwin.tar.gz"
      sha256 "30ab9de829d6b5f148da0bc1fc0ae1b583a9429301ca974eeaf6347a792f2e92"
    end
    on_intel do
      url "https://github.com/agentstatelabs/AgentStateCrucible-releases/releases/download/v0.2.6/crucible-v0.2.6-x86_64-apple-darwin.tar.gz"
      sha256 "72d9e569e4dba0da5f2a8feb531efa7aa0cd479e6a705b84b8efa537fb0b2ba2"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentstatelabs/AgentStateCrucible-releases/releases/download/v0.2.6/crucible-v0.2.6-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "24e47114fb25c2f418f97846147b8b6f0ed99b0f20eadf9718923a18048cf016"
    end
    on_intel do
      url "https://github.com/agentstatelabs/AgentStateCrucible-releases/releases/download/v0.2.6/crucible-v0.2.6-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "acf09370fb325a5e4ab6c84090f7f457e5d7a346060001a0f8097410f7664001"
    end
  end

  def install
    bin.install "crucible"
  end

  test do
    assert_match "crucible", shell_output("#{bin}/crucible --version")
  end
end
