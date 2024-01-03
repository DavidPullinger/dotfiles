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
