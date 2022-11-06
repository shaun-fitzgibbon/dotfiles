# My Dotfiles setup

## things to install

### 1. curl

### 2. brew

```sh
/bin/bash -c “$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 3. Git

```sh
brew install git
```

### 4. Iterm2

```sh
brew install --cask iterm2
```

### 5. Ansible

6.\.ohMyZsh

```sh
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

### 7. powerlevel10k

```sh
brew install romkatv/powerlevel10k/powerlevel10k

echo "source $(brew --prefix)/opt/powerlevel10k/powerlevel10k.zsh-theme" >>~/.zshrc
```

### 8. Install ZSH plugins

- zsh-autosuggestions

```sh
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

- zsh-syntax-highlighting

```sh
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
```

### 9. Install Chezmoi

```sh
curl -sfL https://git.io/chezmoi | sh

chezmoi upgrade
```

## Programs I use

- chrome
- vscode
- nvim
- dashlane
- figma
- whatsapp
- ms suit (word,excel)
- gmail
- slack
- mssql workbench
- alfred
- deluge
- vbcables
