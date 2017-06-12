#!/bin/bash
export PATH="/usr/local/sbin:$PATH" 

# Bash Completion
if [ -f /usr/share/bash-completion/bash_completion ]; then
	. /usr/share/bash-completion/bash_completion
fi
