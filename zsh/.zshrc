# colors that some scripts may need
default="\033[39m"
black="\033[30m"
red="\033[0;31m"
green="\033[32m"
yellow="\033[33m"
blue="\033[34m"
magenta="\033[35m"
cyan="\033[36m"
light_gray="\033[37m"
dark_gray="\033[90m"
light_red="\033[91m"
light_green="\033[92m"
light_yellow="\033[93m"
light_blue="\033[94m"
light_magenta="\033[95m"
light_cyan="\033[96m"
white="\033[97m"

# load all plugins
# plugins should be in their own self-contained directory
# e.g. plugins/foo/foo_main.zsh
for plugin_dir in $ZDOTDIR/plugins/*; do
	for plugin in $plugin_dir/*.zsh; do
		source "$plugin"
	done
done

# load all aliases
for alias in $ZDOTDIR/aliases/*.zsh; do
	source "$alias"
done

# load all scripts
for script in $ZDOTDIR/scripts/*.zsh; do
	source "$script"
done

# other
autoload -Uz compinit
compinit

# history search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
bindkey "^[[A" up-line-or-beginning-search # Up
bindkey "^[[B" down-line-or-beginning-search # Down

# keybindings
bindkey -v
bindkey -s '^ ' 'ts^M'
bindkey -s '^T' 't^M'

eval "$(/opt/homebrew/bin/brew shellenv)"

export PATH="/opt/homebrew/opt/openjdk@11/bin:$PATH"
