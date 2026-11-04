# current/homebrew-tap

```sh
brew install --cask current/tap/wisp
```

Installs [Wisp](https://github.com/current/wisp) and links the `wisp` command.

Wisp is signed ad hoc and not notarized. The cask removes the quarantine flag
from `Wisp.app` after installing, so macOS opens it without the Open Anyway step.
If you would rather do that yourself, download the zip from the
[releases page](https://github.com/current/wisp/releases) instead.
