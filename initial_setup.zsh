#!/bin/zsh

# 1. Some important env variables
echo > ~/.zshenv
echo 'export XDG_CONFIG_HOME="$HOME/.config"' >> ~/.zshenv
echo 'export ZDOTDIR="$XDG_CONFIG_HOME/zsh"' >> ~/.zshenv && mkdir -p ~/.config/zsh

# 2. Homebrew
if ls /opt/homebrew > /dev/null 2>&1; then # I prefer to do this to check for brew
    echo "Homebrew already installed."
else
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zshenv

# 3. Source env from 1 and 2
source ~/.zshenv

# 4. Misc. cli tools & apps
## 4.1 formulae
brew install "git"
brew install "fzf"
brew install "fd"
brew install "ripgrep"
brew install "neovim"
brew install "tmux"
brew install "jq"
brew install "koekeishiya/formulae/skhd"
brew install "koekeishiya/formulae/yabai"
## 4.2 casks
brew install --cask "ghostty"
brew install --cask "zen"
brew install --cask "spotify"
brew install --cask "1password"
brew install --cask "vlc"
brew install --cask "raycast"
brew install --cask "docker"
