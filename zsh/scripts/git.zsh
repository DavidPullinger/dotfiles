# for git pull
gp() {
	has_changes=$(git status --porcelain --untracked-files=no)
	
	if [[ -n $has_changes ]]; then
		gsh
	fi

	git pull origin $(git branch --show-current) --rebase

	if [[ -n $has_changes ]]; then
		gsp
	fi
}

git_new() {
	read "branch?Enter new git branch: "

	if [ -n "$branch" ]; then
		(git switch master && \
		git pull origin master && \
		git checkout -b "$branch") || read # if anything goes wrong, just allow us to read the error
	else
		echo "No branch entered. Press Enter to exit..."; read
	fi
}
