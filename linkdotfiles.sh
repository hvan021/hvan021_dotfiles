
for file in .{archey3.cfg,bash_aliases,bash_profile,bashrc,config,emacs.d,fehbg,gitconfig,gitignore,gitignore_global,pentadactyl,pentadactylrc,tmux,vim,vimrc,xinitrc,Xresources,zshrc}; do
	[ -r ~/"$file" ] && rm -rf ~/"$file" && echo removed ~/"$file"
	[ -r ~/hvan021_dotfiles/"$file" ] && ln -s ~/hvan021_dotfiles/"$file" ~/
done
unset file
