# name your backup folder and your dotfiles dir here
backupdir=~/BAK
dotfiles_dir=~/hvan021_dotfiles

#touch ~/testfile{1,2,3} # debug

if ! [ -d $backupdir ] ; then
    echo "creating $backupdir"
    mkdir $backupdir
fi

for file in .{archey3.cfg,bash_aliases,bash_profile,bashrc,config,emacs.d,fehbg,gitconfig,gitignore,gitignore_global,pentadactyl,pentadactylrc,tmux,vim,vimrc,xinitrc,Xresources,zshrc}; do
#for file in {testfile1,testfile2,testfile3}; do # debug
    original_file=~/$file
    dotfiles="$dotfiles_dir/$file"
    if [ -e $original_file ] && ! [ -L $original_file ]; then # if file exists but not a symbolic link
        echo "$original_file exists" && mv -f $original_file $backupdir && echo "-> backed up"
    fi

    if [ -e $dotfiles ] ; then
        ln -s $dotfiles ~/ && echo "$file linked"
    fi
done
unset file
