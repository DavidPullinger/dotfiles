# PATH stuff
export PATH="$HOME/work/stack/.bin:$PATH"
export PATH="$HOME/work/stack/services/travel/lavender/vendor/bin:$PATH"
eval "$(/opt/homebrew/bin/brew shellenv)"

source "$ZDOTDIR/colors.zsh"
source "$ZDOTDIR/mappings.zsh"

for vendor_dir in $ZDOTDIR/vendor_scripts/*; do
	source "$vendor_dir/index.zsh"
done

for script in $ZDOTDIR/scripts/*.zsh; do
	source "$script"
done

for alias in $ZDOTDIR/aliases/*.zsh; do
	source "$alias"
done

# command completion
autoload -Uz compinit
compinit

# substring history search
autoload -U up-line-or-beginning-search
autoload -U down-line-or-beginning-search
zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search
