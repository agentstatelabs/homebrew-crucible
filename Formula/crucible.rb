# Homebrew formula template for the `agentstatelabs/crucible` tap.
# scripts/render-homebrew.sh substitutes the placeholder markers
# (VERSION and per-target SHA256) from a release's SHA256SUMS and
# prints the final .rb.
#
# Artifact URLs point at the PUBLIC releases mirror published from
# .github/workflows/release.yml (agentstatelabs/AgentStateCrucible-releases).

class Crucible < Formula
  desc "Agent testing and validation framework"
  homepage "https://github.com/agentstatelabs/AgentStateCrucible"
  version "0.2.2"
  license "Apache-2.0"

  on_macos do
    on_arm do
      url "https://github.com/agentstatelabs/AgentStateCrucible-releases/releases/download/v0.2.2/crucible-v0.2.2-aarch64-apple-darwin.tar.gz"
      sha256 "9d63763d03b1739bff80d35ae0cd1a7e5f486a97e37120ea21b12b83da952991"
    end
    on_intel do
      url "https://github.com/agentstatelabs/AgentStateCrucible-releases/releases/download/v0.2.2/crucible-v0.2.2-x86_64-apple-darwin.tar.gz"
      sha256 "61541203cbfca46251ca3e1db4f0468f07f8a99de01860eacd14b23a2d212ba1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/agentstatelabs/AgentStateCrucible-releases/releases/download/v0.2.2/crucible-v0.2.2-aarch64-unknown-linux-gnu.tar.gz"
      sha256 "d733693acbbb6e4874c275cdfbbb7b96d60c72fce37aefb69b2cb85dea3a935f"
    end
    on_intel do
      url "https://github.com/agentstatelabs/AgentStateCrucible-releases/releases/download/v0.2.2/crucible-v0.2.2-x86_64-unknown-linux-gnu.tar.gz"
      sha256 "76efbf6f422e9b55b0aacf545de9b926e4d6630467cc95b584de1035baa5fb01"
    end
  end

  def install
    bin.install "crucible"
  end

  test do
    assert_match "crucible", shell_output("#{bin}/crucible --version")
  end
end
