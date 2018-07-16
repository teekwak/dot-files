# colors
GREEN=$(tput setaf 2)
CYAN=$(tput setaf 6)
RED=$(tput setaf 1)
BOLD=$(tput bold)
RESET=$(tput sgr 0)

parse_git_branch() {
	branchName=$(git symbolic-ref -q --short HEAD 2> /dev/null)

	if [[ $branchName ]]; then
		echo -e " \[$CYAN\][⭠ ${branchName}$(number_of_git_changes)]\[$RESET\]";
	fi
}

number_of_git_changes() {
	read additions deletions <<< $(git diff --numstat | awk '{additions += $1}{deletions += $2}END{print additions " " deletions}')

	if [[ $additions > 0 && $deletions > 0 ]]; then
		echo -e " [ \[$GREEN\]+${additions} | \[$RED\]-${deletions}\[$CYAN\] ]"
	elif [[ $additions > 0 ]]; then
		echo -e " [ \[$GREEN\]+${additions}\[$CYAN\] ]"
	elif [[ $deletions > 0 ]]; then
		echo -e " [ \[$RED\]-${deletions}\[$CYAN\] ]"
	fi
}

show_command_status() {
    if [[ $? == 0 ]]; then
        echo -e "\[$GREEN\]✔\[$RESET\]"
    else
        echo -e "\[$RED\]✘\[$RESET\]"
    fi
}

show_virtual_env() {
	if [ -n "$VIRTUAL_ENV" ]; then
		echo "($(basename $VIRTUAL_ENV)) "
	fi
}
export -f show_virtual_env

show_user_info() {
    echo -e "[\u] \w"
}

custom_prompt_command() {
    PS1="$(show_command_status) \[$BOLD\]"
    PS1+="$(show_virtual_env)"
    PS1+="$(show_user_info)"
    PS1+="$(parse_git_branch)"
    PS1+=" ❯❯❯ \[$RESET\]"
}

PROMPT_COMMAND=custom_prompt_command


# this activates/deactivates virtualenv automatically
# this relies on virtualenv being named "venv"
#cd() {
#    builtin cd "$@"
#    if [ -d "venv" ]; then
#		if [ "$VIRTUAL_ENV" = "" ]; then
#        	source venv/bin/activate
#		fi
#	else
#		if [ "$VIRTUAL_ENV" != "" ]; then
#			deactivate
#		fi
#    fi
#}

alias ls="ls -G"
alias vscode="code"
alias chrome="open -a Google\ Chrome"
alias tma="tmux a -t"
alias tml="tmux ls"
alias tmn="tmux new -s"
alias mm="make minimal"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
export PATH="/usr/local/sbin:$PATH"
export TERM="screen-256color"
export PATH="$(brew --prefix php@7.1)/bin:$PATH"
eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)"

# go
export PATH=$PATH:$(go env GOPATH)/bin
export GOPATH=$(go env GOPATH):~/Desktop/golang

# direnv
eval "$(direnv hook bash)"
export DIRENV_LOG_FORMAT=

# spark
export SPARK_HOME=/usr/local/Cellar/apache-spark/2.0.1/libexec
export PYTHONPATH=/usr/local/Cellar/apache-spark/2.0.1/libexec/python/:$PYTHONP$

# dart
export PATH="$PATH":"~/.pub-cache/bin"

# curl
export PATH="/usr/local/opt/curl/bin:$PATH"

