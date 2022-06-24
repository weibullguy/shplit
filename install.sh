#!/bin/sh

backup() {
    # -----------------------------------------------------------------------
    # Backup existing configuration files.
    # -----------------------------------------------------------------------
    __profile_is_link="false"
    __rc_is_link="false"

    if [ -L $HOME/.bash_profile ]; then
        __profile_is_link="true"
    fi

    if [ -L $HOME/.bashrc ]; then
        __rc_is_link="true"
    fi

    if [ "$__profile_is_link" = "true" ]; then
        rm $HOME/.bash_profile
    else
        cp $HOME/.bash_profile $HOME/.bash_profile_shplit_bak
    fi

    if [ "$__rc_is_link" = "true" ]; then
        rm $HOME/.bashrc
    else
        cp $HOME/.bashrc $HOME/.bashrc_shplit_bak
    fi
}

install() {
    # -----------------------------------------------------------------------
    # Install shplit files.
    # -----------------------------------------------------------------------
    mkdir $HOME/.config/shplit
    cp configs/* $HOME/.config/shplit
    cp bash/bash_profile $HOME/.bash_profile
    cp bash/bashrc $HOME/.bashrc
}

uninstall() {
    # -----------------------------------------------------------------------  
    # Remove shplit files.
    # -----------------------------------------------------------------------
    cp $HOME/.bash_profile_shplit_bak $HOME/.bash_profile
    cp $HOME/.bashrc_shplit_bak $HOME/.bashrc
    rm -fr $HOME/.config/shplit
}

do_backup="false"
do_install="false"
do_uninstall="false"
while test $# -gt 0; do
    case "$1" in
        -b|--backup) 
            shift
            do_backup="true"
            ;;
        -i|--install) 
            shift
            do_install="true"
            ;;
        -u|--uninstall)
            shift
            do_uninstall="true"
            ;;
    esac
done

if [ "$do_backup" = "true" ]; then
    backup
fi
if [ "$do_install" = "true" ]; then
    install
fi
if [ "$do_uninstall" = "true" ]; then
    uninstall
fi

