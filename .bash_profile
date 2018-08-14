# colors
GREEN=$(tput setaf 2)
CYAN=$(tput setaf 6)
RED=$(tput setaf 1)
BOLD=$(tput bold)
RESET=$(tput sgr 0)

export FZF_DEFAULT_COMMAND='
    (git ls-tree -r --name-only HEAD ||
    find . -path "*/\.*" -prune -o -type f -print -o -type l -print |
    sed s/^..//) 2> /dev/null'

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

alias ls="ls -G"
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

# spark
export SPARK_HOME=/usr/local/Cellar/apache-spark/2.3.1/libexec
export PYTHONPATH=/usr/local/Cellar/apache-spark/2.3.1/libexec/python/:$PYTHONP$
export PYSPARK_PYTHON=python3

# dart
export PATH="$PATH":"~/.pub-cache/bin"

# curl
export PATH="/usr/local/opt/curl/bin:$PATH"

