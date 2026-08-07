# WildFoundry Homebrew Tap

Third-party Homebrew formulae for Dataplicity tools. These are not in Homebrew core; add the tap, trust the formula, then install.

## Dataplicity CLI

```bash
brew tap wildfoundry/tap
brew trust --formula wildfoundry/tap/dataplicity-cli
brew install wildfoundry/tap/dataplicity-cli
dataplicity --help
```

Source: https://github.com/wildfoundry/dataplicity-cli

## Dataplicity Lens

```bash
brew tap wildfoundry/tap
brew trust --formula wildfoundry/tap/dataplicity-lens
brew install wildfoundry/tap/dataplicity-lens
lens --version
```

Source: https://github.com/wildfoundry/dataplicity-lens  
Docs: https://lens.dataplicity.com/

## Contribution and release safety

- External contributors are welcome to open pull requests.
- Only internal maintainers should have write/admin access and merge authority.
- Protected-branch checks must pass before any merge to `main`.
