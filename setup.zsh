#!/bin/zsh

function install_homebrew {

}

function install_oh_my_zsh {

}

function install_vim {
    # install vim-plug
    if [[ ! -f ~/.vim/autoload/plug.vim ]]
    then
        curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    fi

    vim +PlugInstall +PlugUpgrade +qall
}

function install_tmux {

}

() {
    install_vim
}
