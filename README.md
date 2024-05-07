# My Dotfiles setup

## things to install

### Run chezmoi script to install everything

```sh

# Install xcode utilities
xcode-select --install

# Install Brew
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"


# Install an apply chezmoi repo
sh -c "$(curl -fsLS get.chezmoi.io)" -- init --apply $GITHUB_USERNAME
# or
brew install chezmoi
chezmoi init --apply https://github.com/$GITHUB_USERNAME/dotfiles.git
```

## Programs I manually install

- excel
- word
- vbcables
- mac mouse fix
- Photoshop
- Illustrator
- In-design
- mssql workbench
