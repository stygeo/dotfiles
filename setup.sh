#! /bin/bash

DIR="$( cd -P "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
BACKUPDIR="$HOME/dotfiles.backup"

echo "Backing up files to '$BACKUPDIR'."

if [ -d $BACKUPDIR ]; then
  rm -rf $BACKUPDIR
fi

mkdir -p "$BACKUPDIR"/r/

DOTFILES=( pryrc vimrc.after vimrc.before zsh_aliases zshrc zlogin gitconfig tmux.conf )
for file in ${DOTFILES[@]}; do
  if [ $HOME/.$file ]; then
    mv $HOME/.$file $BACKUPDIR/$file
    ln -s $DIR/$file $HOME/.$file
  fi
done

# Manual stuff
if [[ $HOME/.oh-my-zsh && $HOME/.oh-my-zsh/themes/stygeo.zsh-theme ]]; then
  rm $HOME/.oh-my-zsh/themes/stygeo.zsh-theme
fi

ln -s $DIR/stygeo.zsh-theme $HOME/.oh-my-zsh/themes/stygeo.zsh-theme
ln -s $DIR/awesome.rc.lua $HOME/.config/awesome/rc.lua

