# for git pull
gp() {
	gsh && git pull origin $(git branch --show-current) --rebase && gsp
}

# for git pull without stash
gpp() {
	git pull origin $(git branch --show-current) --rebase
}
