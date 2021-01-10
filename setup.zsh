#!/bin/zsh

# should have option of overriding all things!
# should default to not overriding if file exists

TARGET_DIRECTORY="~"

function copy_dot_files_to_homedir {
    local excluded_files=(
        'README.md'
        'setup.zsh'
    )

    # ls -ap | grep -v '/$' | grep -Ev "${excluded_files[*]// /|}" | xargs -I {} cp {} ~/{}
}

function install_homebrew {
    printf "Starting homebrew setup\n"

    if [[ ! -d /usr/local/Homebrew ]]
    then
        printf "Homebrew not found. Installing homebrew\n"
        /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
    else
        printf "Homebrew already installed. Skipping installation\n"
    fi

    # TODO: run Brewfile
    printf "Finished homebrew setup\n"
}

function install_oh_my_zsh {
    local ZSH="/Users/$USER/.oh-my-zsh"

    if [[ ! -d $ZSH ]]; then
        git clone --depth=1 https://github.com/robbyrussell/oh-my-zsh.git $ZSH
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH/custom/plugins/zsh-syntax-highlighting
        git clone https://github.com/romkatv/powerlevel10k.git $ZSH/custom/themes/powerlevel10k
    fi
}

function install_vim_plugins {
    if [[ ! -f ~/.vim/autoload/plug.vim ]]
    then
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi

    vim +PlugInstall +PlugUpgrade +qall
}

function install_tmux_plugins {

}

# getopt -f = force

() {
    # check that this is a darwin pc
    if ! [[ "$OSTYPE" =~ "^darwin" ]]
    then
        echo "[error] This script is specific to Mac OS."
        exit 1
    fi

    # check that the shell is ZSH
    echo $SHELL

    # copy_dot_files_to_homedir

    # TODO: copy dot files to home directory
    # install_homebrew
    # install_vim_plugins

    source ~/.zshrc
}
