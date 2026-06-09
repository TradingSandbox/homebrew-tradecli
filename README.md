# homebrew-tradecli

Homebrew tap for [`tradecli`](https://tradecli.app) — an AI trading assistant for the Indian stock market.

## Install

```bash
brew install TradingSandbox/tradecli/tradecli
```

Or, as two steps:

```bash
brew tap TradingSandbox/tradecli
brew install tradecli
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

## Formula Template

`Formula/tradecli.rb` is generated from `templates/tradecli.rb.erb`. Edit the template for packaging policy changes such as dependencies, tests, caveats, and install behavior. The upstream release pipeline runs `scripts/render-formula.rb` to fill in the release tag and archive SHAs.
