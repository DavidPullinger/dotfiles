pip3() {
	if [ -n "$VIRTUAL_ENV" ]; then
		command pip3 "$@"
	else
		confirmation=; vared -p "%B%F{yellow}Do you want to execute pip outside venv (y/n)? %f%b" confirmation
		if [ "$confirmation" = "y" ]; then
			command pip3 "$@"
		else
			echo "Aborted."
		fi
	fi
}
