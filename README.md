# Homebrew Tap for AgentStateCrucible

```sh
brew tap agentstatelabs/crucible
brew install crucible
```

Canonical source: <https://github.com/agentstatelabs/AgentStateCrucible>.
Release artifacts: <https://github.com/agentstatelabs/AgentStateCrucible-releases/releases>.

## Maintainers

`Formula/crucible.rb` is written by CI, not by hand. The `homebrew` job in
AgentStateCrucible's `.gitlab-ci.yml` (`scripts/publish-homebrew.sh`) runs on
each release tag's pipeline: it waits for the release assets, hashes the
Homebrew tarballs, renders the formula, and pushes it to the GitLab copy of
this repo.

Pushing to `main` there runs `version-guard`, then `publish-github`, which
leak-scans and force-pushes here. GitLab is the source of truth — do not
commit to this GitHub repo directly, or the next push from GitLab overwrites
it. The standalone `homebrew-tap.yml` workflow was retired from the source
repos for writing here directly.

The GitLab project is named `homebrew-agentstatecrucible` while this mirror is
`homebrew-crucible`; the names differ because `brew tap` derives the repo name
from the tap name, and the tap is `agentstatelabs/crucible`.

`version-guard` fails, so nothing is mirrored, when a push would lower the
formula's version, e.g. when an old release tag's pipeline is re-run. To roll
back on purpose, end the commit message with the trailer
`Allow-Downgrade: <version>`, or run a pipeline on `main` with the variable
`TAP_ALLOW_DOWNGRADE=<version>`. See `scripts/version-guard.py`.
