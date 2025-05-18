#!/bin/zsh

# 1. Some important env variables
echo > ~/.zshenv
echo 'export XDG_CONFIG_HOME="$HOME/.config"' >> ~/.zshenv
echo 'export ZDOTDIR="$XDG_CONFIG_HOME/zsh"' >> ~/.zshenv && mkdir -p ~/.config/zsh
source ~/.zshenv

# 2. Homebrew
if ls /opt/homebrew > /dev/null 2>&1; then # I prefer to do this to check for brew
    echo "Homebrew already installed."
else
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

# 3. Misc. cli tools & apps
## 3.1 formulae
brew install "git"
brew install "fzf"
brew install "fd"
brew install "ripgrep"
brew install "neovim"
brew install "tmux"
brew install "jq"
brew install "koekeishiya/formulae/skhd"
brew install "koekeishiya/formulae/yabai"
## 3.2 casks
brew install --cask "ghostty"
brew install --cask "zen"
brew install --cask "spotify"
brew install --cask "1password"
brew install --cask "vlc"
brew install --cask "raycast"
brew install --cask "docker"

# 4. Some important config for some of the above
echo "$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | cut -d " " -f 1) $(which yabai) --load-sa" | sudo tee /private/etc/sudoers.d/yabai

# 5. Some macos config
mkdir -p ~/Library/LaunchAgents
cp plist/* ~/Library/LaunchAgents

launchctl unload ~/Library/LaunchAgents/
launchctl load ~/Library/LaunchAgents/
