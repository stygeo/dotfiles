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

ln -s $PWD/pryrc ~/.pryrc
ln -s $PWD/vimrc.after ~/.vimrc.after
ln -s $PWD/zsh_aliases ~/.zsh_aliases
ln -s $PWD/zshrc ~/.zshrc

echo "Link gitconfig manually and add your [github] profile settings"
