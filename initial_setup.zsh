#!/bin/zsh

# 1. Change default zsh directory
echo '
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export ZDOTDIR="$XDG_CONFIG_HOME/zsh"
' > ~/.zshenv
mkdir -p ~/.config/zsh
source ~/.zshenv

# 2. Homebrew install
if ls /opt/homebrew > /dev/null 2>&1; then # I prefer to do this to check for brew
    echo "Homebrew already installed."
else
    echo "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
fi
eval "$(/opt/homebrew/bin/brew shellenv)"

# 3. Formulae, casks and taps
export HOMEBREW_BUNDLE_FILE_GLOBAL=$(pwd)/brew/formulae.brewfile
brew bundle check --global || brew bundle install --global
export HOMEBREW_BUNDLE_FILE_GLOBAL=$(pwd)/brew/casks.brewfile
brew bundle check --global || brew bundle install --global

# 4. Some important config for some of the above
echo "$(whoami) ALL=(root) NOPASSWD: sha256:$(shasum -a 256 $(which yabai) | cut -d " " -f 1) $(which yabai) --load-sa" | sudo tee /private/etc/sudoers.d/yabai

# 5. Some macos config
mkdir -p ~/Library/LaunchAgents
cp plist/* ~/Library/LaunchAgents

launchctl unload ~/Library/LaunchAgents/
launchctl load ~/Library/LaunchAgents/
