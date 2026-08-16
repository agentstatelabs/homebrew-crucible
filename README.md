# homebrew-agentstatecrucible

GitLab-side source of truth for the AgentStateCrucible Homebrew tap.

**Users do not install from here.** This repo is mirrored to
`github.com/agentstatelabs/homebrew-crucible`, which is the tap Homebrew
resolves:

```bash
brew tap agentstatelabs/crucible
brew install crucible
```

## How the formula gets updated

`Formula/crucible.rb` is written by CI, not by hand. The `homebrew` job in
AgentStateCrucible's `.github/workflows/release.yml` runs after a release is
published, computes sha256 from the same build artifacts that were uploaded,
renders the formula, and pushes here.

Pushing to `main` triggers `publish-github`, which leak-scans and then
force-pushes to the GitHub tap. GitLab wins deterministically — do not write
to the GitHub tap directly, or the next release push will be rejected non-ff.
That failure mode is why the standalone `homebrew-tap.yml` workflow was
retired from the source repos.

## Note on naming

This project is `homebrew-agentstatecrucible`; it mirrors to
`homebrew-crucible`. The names deliberately differ — `brew tap` derives the
repo name from the tap name, and the tap is `agentstatelabs/crucible`.
