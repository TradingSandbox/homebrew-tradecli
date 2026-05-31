# homebrew-tradecli

Homebrew tap for [`tradecli`](https://tradecli.app) — an AI trading assistant for the Indian stock market.

## Install

```bash
brew install TradingSandbox/tradecli/tradecli
```

This installs `herdr` from the same tap as a pinned upstream Herdr runtime for
`tradecli --herdr` and `tradecli office --herdr`.

Or, as two steps:

```bash
brew tap TradingSandbox/tradecli
brew install tradecli
```

To test only the Herdr runtime package:

```bash
brew install TradingSandbox/tradecli/herdr
herdr --version
```

## Upgrade

```bash
brew upgrade tradecli
```

## Uninstall

```bash
brew uninstall tradecli
brew untap TradingSandbox/tradecli
```

## Supported Platforms

| Platform | Install method |
|---|---|
| macOS (Apple Silicon) | `brew install` |
| Linux (x64) | `brew install` |
| Windows (x64) | Download `.zip` from the [releases page](https://github.com/TradingSandbox/homebrew-tradecli/releases) |

## Versioning

`tradecli` follows semver. New releases are published to this repo's [Releases](https://github.com/TradingSandbox/homebrew-tradecli/releases), and the formula is updated automatically by the upstream release pipeline.

Check your installed version:

```bash
tradecli --version
```
