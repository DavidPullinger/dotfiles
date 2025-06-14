function tmx() {
	typeset -A sessions

	sessions[global]=~/work/stack/
	sessions[travel]=~/work/stack/services/travel/
	sessions[lavender]=~/work/stack/services/travel/lavender/
	sessions[rates-manager]=~/work/stack/services/rates-manager/
	sessions[tool]=~/work/stack/tool/
	sessions[scratch_pad]=~/work/scratch_pad/

	# create sessions, and on each create a vim and zsh window
	for session in ${(k)sessions}; do
		if ! tmux has-session -t $session 2>/dev/null; then
		    tmux new-session -d -s $session -c "$sessions[$session]"
			# nvim window
			tmux rename-window -t $session:0 nvim
            tmux send-keys -t $session:nvim "nvim ." C-m
			# zsh window
		    tmux new-window -t $session -n zsh -c "$sessions[$session]" "zsh"
		fi
	done

	# attach to the first session
	tmux attach-session -t global
}

function t() {
	local directories=(~/work ~/personal)
	local selected_dir=$(fd ".*" --type d $directories | sed "s|$HOME/||g" | fzf)
	if [ -z "$selected_dir" ]; then
		return 1
	fi

	local session_name=$(basename "$selected_dir")
	tmux new-session -s "$session_name" -c "$HOME/$selected_dir"
}

function ts() {
	local selected_dir=$(tmux list-sessions -F \#S | fzf)
	if [ -z "$selected_dir" ]; then
		return 1
	fi

	if [ -z "$TMUX" ]; then
		tmux attach-session -t $selected_dir
	else
		tmux switch-client -t $selected_dir
	fi
}
