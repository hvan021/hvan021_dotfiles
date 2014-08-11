#Windows settings only here
#alias subl='"/c/Program Files/Sublime Text 2/sublime_text.exe"'
#alias vim='"/d/Vim/vim74/gvim.exe"'


if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" || "$OSTYPE" == "win64" ]]; then
    alias la='ls -alh --color=always'
else
    alias la='ls -alh'
fi

alias ga='git add'
alias gb='git branch'
alias gc='git commit'
alias gca='git commit -a'
alias gcam='git commit -a -m'
alias gd='git diff'
alias gl='git lg'
alias glg='git log'
alias gu='git push'
alias gp='git pull'
# gs is sometimes used because of 'Ghostscript', but overwrite it anyway
alias gs='git status'
mkcd(){ dir=$1; mkdir -p $dir && cd $dir; }


alias rdc='rdesktop -g 90% -P -z -x l -r sound:off -u Administrator tdasrv'
