#!/bin/sh

exe_name=$0
action=$1

function make_dir()
{
    mkdir -p ~/.vim/plugin
    mkdir -p ~/.vim/doc
    mkdir -p ~/.vim/autoload
    mkdir -p ~/.vim/color
}

function init()
{
    make_dir
    echo "" > ~/.vimrc
}

function install_common_config()
{
    cat ./config/global.vimrc >> ~/.vimrc
    cat ./config/indent.vimrc >> ~/.vimrc
    cat ./config/path_var.vimrc >> ~/.vimrc
    cat ./config/win_switch.vimrc >> ~/.vimrc
}

function install_nerdtree()
{
    cp -r ./vim_plugin/nerdtree/* ~/.vim/
    cat ./config/nerdtree.vimrc >> ~/.vimrc
}

function install_taglist()
{
    cp -r ./vim_plugin/taglist_46/* ~/.vim/
    cat ./config/taglist.vimrc >> ~/.vimrc
}

function install_cscope()
{
    cat ./config/cscope.vimrc >> ~/.vimrc
    sudo cp ./config/create /bin
}

function install_minibuffer()
{
    cp -r ./vim_plugin/minibufexpl.vim ~/.vim/plugin/
    cat ./config/minibuf.vimrc >> ~/.vimrc
}

function install_tasklist()
{
    cp -r ./vim_plugin/tasklist.vim ~/.vim/plugin/
    cat ./config/tasklist.vimrc >> ~/.vimrc
}

function install_vimoutline()
{
    cp -r ./vim_plugin/vimoutliner-122/* ~/.vim/
    cat ./config/vimoutline.vimrc >> ~/.vimrc
}

function install_snipMate()
{
    cp -r ./vim_plugin/snipMate/* ~/.vim/
}

function install_spell()
{
    cat ./config/spell.vimrc >> ~/.vimrc
}

function install_autocomplpop()
{
    cp -r ./vim_plugin/vim-autocomplpop/* ~/.vim/
}

function install_nerdcomment()
{
    cp -r ./vim_plugin/nerdcommenter/* ~/.vim/
    cat ./config/comment.vimrc >> ~/.vimrc
}

function install_statusline()
{
    cat ./config/statusline.vimrc >> ~/.vimrc
}

function install_file_alter()
{
    cp -r ./vim_plugin/a.vim ~/.vim/plugin/
    cat ./config/alternative.vimrc >> ~/.vimrc
}

function install_mru()
{
    cp -r ./vim_plugin/mru.vim ~/.vim/plugin/
    cat ./config/mru.vimrc >> ~/.vimrc
}

function install_pathogen()
{
    cp -r ./vim_plugin/pathogen.vim ~/.vim/autoload/
    cat ./config/pathogen.vimrc >> ~/.vimrc
}

function install_syntastic()
{
    cp -r ./vim_plugin/syntastic/* ~/.vim/
    cat ./config/syntastic.vimrc >> ~/.vimrc
}

function install_omnicppcomplete()
{
    cp -r ./vim_plugin/omnicppcomplete-0/* ~/.vim/
    cat ./config/omnicpp.ctags >> ~/.ctags
}

function install_colorpalette()
{
    cp -r ./vim_plugin/color.vim ~/.vim/syntax/palette.vim
    cp -r ./config/palette ~/.vim/color/.palette
    cat ./config/color_palette.vimrc >> ~/.vimrc
}

function install_time()
{
    cat ./config/time.vimrc >> ~/.vimrc
}

function menu()
{
    echo "usage:"
    echo "    $exe_name --install|-i"
}

case $action in
    -i | --install)
        echo installing
        init
        install_common_config
        install_nerdtree
        install_taglist
        install_cscope
        install_minibuffer
        install_tasklist
        install_vimoutline
        install_snipMate
        install_spell
        install_autocomplpop
        install_nerdcomment
        install_statusline
        install_file_alter
        install_mru
        install_pathogen
        install_syntastic
        install_omnicppcomplete
        install_colorpalette
        install_time
        echo done
        ;;
    *)
        menu
        ;;
esac

