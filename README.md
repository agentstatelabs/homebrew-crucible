# Homebrew Tap for AgentStateCrucible

```sh
brew tap agentstatelabs/crucible
brew install crucible
```

Canonical source: <https://github.com/agentstatelabs/AgentStateCrucible>.
Release artifacts: <https://github.com/agentstatelabs/AgentStateCrucible-releases/releases>.

## Maintainers

`Formula/crucible.rb` is written by CI, not by hand. The `homebrew` job in
AgentStateCrucible's `.github/workflows/release.yml` runs after a release is
published, computes sha256 from the same build artifacts that were uploaded,
renders the formula, and pushes to the GitLab copy of this repo.

Pushing to `main` there triggers `publish-github`, which leak-scans and then
force-pushes here. GitLab is the source of truth — do not commit to this
GitHub repo directly, or the next release push will be rejected non-ff. That
failure mode is why the standalone `homebrew-tap.yml` workflow was retired
from the source repos.

The GitLab project is named `homebrew-agentstatecrucible` while this mirror is
`homebrew-crucible`; the names differ because `brew tap` derives the repo name
from the tap name, and the tap is `agentstatelabs/crucible`.
