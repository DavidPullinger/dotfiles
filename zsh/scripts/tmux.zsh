# lazy me... creates a bunch of tmux sessions in common directories
# each with one nvim window and one zsh window to boot
function tmx() {
	typeset -A sessions

	sessions[global]=~/work/stack/
	sessions[travel]=~/work/stack/services/travel/
	sessions[lavender]=~/work/stack/services/travel/lavender/
	sessions[rates-manager]=~/work/stack/services/rates-manager/
	sessions[tool]=~/work/stack/tool/
	sessions[scratch_pad]=~/work/scratch_pad/
	sessions[config]=~/.config/

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

# fuzzy find across subdirs in ~/work and ~/personal
# create new session with the same name as selected directory
function tmux_new() {
	local directories=(~/work ~/personal) # make more dynamic? Maybe ~/ with some smart excludes
	local selected_dir=$(fd ".*" --type d $directories | sed "s|$HOME/|~/|g" | fzf)
	selected_dir=${selected_dir/\~/$HOME}

	if [ -z "$selected_dir" ]; then
		return 0
	fi

	local session_name=$(basename "$selected_dir")
	
	# check for exact match (-t=)
	if tmux has-session -t="$session_name" 2>/dev/null; then
		tmux switch-client -t "$session_name"
		return 0
	fi

	# create the session detached so that I can call this from inside tmux
	tmux new-session -d -s "$session_name" -c "$selected_dir"

	if [ -z "$TMUX" ]; then
		tmux attach-session -t $session_name
	else
		tmux switch-client -t $session_name
	fi
}

# fuzzy find across current sessions
# if we're attached already, switch to selection
# otherwise, attach to selection
function tmux_switch() {
	sessions=$(tmux list-sessions -F '#S')
	current=$(tmux display-message -p '#S')
	target=$(echo "$sessions" | rg --invert-match "${current}" | fzf --reverse)

	# if we didn't select anything, exit
	if [[ -z "$target" ]]; then
		return 0
	fi

	if [ -z "$TMUX" ]; then
		tmux attach-session -t $target
	else
		tmux switch-client -t $target
	fi
}
