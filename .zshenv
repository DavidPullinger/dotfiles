export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$XDG_CONFIG_HOME/local/cache"
export XDG_DATA_HOME="$XDG_CONFIG_HOME/local/share"
export XDG_STATE_HOME="$XDG_CONFIG_HOME/local/state"

export ZDOTDIR="$XDG_CONFIG_HOME/zsh"

export FZF_DEFAULT_COMMAND="fd --hidden ".""

export PIPX_HOME="$XDG_DATA_HOME/pipx"
export PIPX_BIN_DIR="/opt/pipx/bin"
export PATH="$PATH:$PIPX_BIN_DIR"

export LESSHISTFILE=-

export EDITOR="nvim"

export NODE_REPL_HISTORY="$XDG_DATA_HOME/node/repl_history"

