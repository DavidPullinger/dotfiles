function update_git_prompt() {
	git_head=$(git rev-parse --abbrev-ref HEAD 2> /dev/null)
	if [ -z "$git_head" ]; then
		git_prompt=""
		return
	fi

	# get difference between origin and local
	local my_head="$(git rev-parse @ 2> /dev/null)"
	local my_upstream="$(git rev-parse @{u} 2> /dev/null)"
	local my_base="$(git merge-base @ @{u} 2> /dev/null)"
	local my_status=""
	if [ -z "$my_upstream" ]; then
		my_status="?"
	elif [ "$my_head" = "$my_upstream" ]; then
		my_status="="
	elif [ "$my_head" = "$my_base" ]; then
		my_status="↓"
	elif [ "$my_upstream" = "$my_base" ]; then
		my_status="↑"
	else
		my_status="↕"
	fi

	git_prompt=" on %B%F{red} $git_head ($my_status)"
}

setopt prompt_subst
precmd_functions+=update_git_prompt

NEWLINE=$'\n'
PS1='%B%F{yellow}%n%B%F{white} @ %B%F{cyan}(%3~)%B%F{white}$git_prompt$NEWLINE%B%(?.%F{blue}.%F{red})>> %b%f'
