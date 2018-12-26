#!/usr/bin/env bash
## Will be (and must be) rewrited in .bash_rc (.bash_profile) file
DOTDIR=$HOME'/repo/www/dots';
BAK_FOLDER=$HOME/backups;
TIME=$(date '+%d-%m-%Y___%H_%M');


## Create backup folder if missed
if [ ! -d $BAK_FOLDER ]; then
    mkdir $BAK_FOLDER;
fi

## Link SSH folder
    SSH=$HOME/.ssh;
    if [ -d $SSH ]; then
        cp -R $SSH/ "$BAK_FOLDER/.ssh__{$TIME}/"
    fi
    ln -sfn $DOTDIR/access/ssh $SSH;

## Link git-config file
    GITCONFIG=$HOME/.gitconfig;
    if [ -f $GITCONFIG ]; then
        cp $GITCONFIG "$BAK_FOLDER/.gitconfig_{$TIME}.bak"
    fi
    ln -sfn $DOTDIR/git/.gitconfig $GITCONFIG;

## Link profile file
    BASH_RC=$HOME/.bash_profile;
    if [ -f $BASH_RC ]; then
        cp $BASH_RC "$BAK_FOLDER/.bash_profile_{$TIME}.bak"
    fi
    ln -sfn $DOTDIR/.bash_profile_mac $BASH_RC;


## Link profile file
    NGROK=$HOME/.ngrok2;
    if [ -d $NGROK ]; then
        cp -R $NGROK/ "$BAK_FOLDER/.ngrok2__{$TIME}/"
    fi
    ln -sfn $DOTDIR/access/ngrok $NGROK;
