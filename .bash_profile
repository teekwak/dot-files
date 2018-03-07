# colors
GREEN=$(tput setaf 2)
CYAN=$(tput setaf 6)
RED=$(tput setaf 1)
BOLD=$(tput bold)
RESET=$(tput sgr 0)

# get git branch name
parse_git_branch() {
	branchName=$(git symbolic-ref -q --short HEAD 2> /dev/null)

	if [[ $branchName ]]; then
		echo "[⭠ ${branchName}$(number_of_git_changes)] ";
	fi
}

number_of_git_changes() {
	read additions deletions <<< $(git diff --numstat | awk '{additions += $1}{deletions += $2}END{print additions " " deletions}')

 	if [[ $additions > 0 && $deletions > 0 ]]; then
		echo " [ $GREEN+${additions}$CYAN | $RED-${deletions}$CYAN ]"
	elif [[ $additions > 0 ]]; then
    	echo " [ $GREEN+${additions}$CYAN ]"
	elif [[ $deletions > 0 ]]; then
		echo " [ $RED-${deletions}$CYAN ]"
	fi
}

export PS1='$(if [[ $? == 0 ]]; then printf "\[$GREEN\]✔"; else printf "\[$RED\]✘"; fi)\[$RESET\] \[$BOLD\][\u] \w\[$CYAN\] $(parse_git_branch)\[$RESET\]\[$BOLD\]❯❯❯\[$RESET\] '

# install https://github.com/powerline/powerline
#powerline-daemon -q
#. /usr/local/lib/python3.6/site-packages/powerline/bindings/bash/powerline.sh

alias ls="ls -G"
alias vscode="code"
alias chrome="open -a Google\ Chrome"
alias tma="tmux a -t"
alias tml="tmux ls"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
export PATH="/usr/local/sbin:$PATH"
export TERM="screen-256color"
export PATH="$(brew --prefix homebrew/php/php71)/bin:$PATH"
eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)"

# go
export PATH=$PATH:$(go env GOPATH)/bin
export GOPATH=$(go env GOPATH):~/Desktop/golang
