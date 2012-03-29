BACKUPDIR="$HOME/dotfiles.backup"

echo "Backing up files to '$BACKUPDIR'."

if [ -d $BACKUPDIR ]; then
  rm -rf $BACKUPDIR
fi

mkdir -p "$BACKUPDIR"/r/

if [ $HOME/.pryrc ]; then
  mv ~/.pryrc $BACKUPDIR/pryrc
fi

if [ $HOME/.vimrc.after ]; then
  mv ~/.vimrc.after $BACKUPDIR/vimrc.after
fi

if [ $HOME/.zsh_aliases ]; then
  mv ~/.zsh_aliases $BACKUPDIR/zsh_aliases
fi

if [ $HOME/.zshrc ]; then
  mv ~/.zshrc $BACKUPDIR/zshrc
fi

if [[ $HOME/.oh-my-zsh && $HOME/.oh-my-zsh/themes/stygeo.zsh-theme ]]; then
  rm $HOME/.oh-my-zsh/themes/stygeo.zsh-theme
fi

ln -s $PWD/pryrc $HOME/.pryrc
ln -s $PWD/vimrc.after $HOME/.vimrc.after
ln -s $PWD/zsh_aliases $HOME/.zsh_aliases
ln -s $PWD/zshrc $HOME/.zshrc
ln -s $PWD/stygeo.zsh-theme $HOME/.oh-my-zsh/themes/stygeo.zsh-theme

echo "Link gitconfig manually and add your [github] profile settings"
