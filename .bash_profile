# colors
GREEN=$(tput setaf 2)
RED=$(tput setaf 1)
RESET=$(tput sgr 0)

# get git branch name
parse_git_branch() {
    git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/ (\1)/'
}

# random crap :D
export PS1='`if [[ $? -eq 0 ]]; then echo "\[$GREEN\]✔"; else echo "\[$RED\]✘"; fi;`\[$RESET\] \w @ \h [\u]\[$GREEN\]`parse_git_branch` \[$RESET\]$ '
cd /

alias ls="ls -G"
alias vscode="code"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
export PATH="/usr/local/sbin:$PATH"
export PATH="$(brew --prefix homebrew/php/php71)/bin:$PATH"
eval "$(perl -I$HOME/perl5/lib/perl5 -Mlocal::lib)"
export PATH=$PATH:$(go env GOPATH)/bin
export GOPATH=$(go env GOPATH)
