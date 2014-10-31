#Windows settings only here
#alias subl='"/c/Program Files/Sublime Text 2/sublime_text.exe"'
#alias vim='"/d/Vim/vim74/gvim.exe"'


if [[ "$OSTYPE" == "msys" || "$OSTYPE" == "win32" || "$OSTYPE" == "win64" || "$OSTYPE" == "cygwin" ]]; then
    # refers to http://superuser.com/questions/650322/ignore-ntuser-dat-files-when-ls-on-git-bash
    #LS_COMMON="-hG"
    ## --color : On Windows7 this produces permission errors, e.g. for Music folder:
    ## LS_COMMON="$LS_COMMON --color=auto"
    #LS_COMMON="$LS_COMMON -I NTUSER.DAT\* -I ntuser.dat\*"
    #LS_COMMON="$LS_COMMON -I AppData\*"
    #LS_COMMON="$LS_COMMON -I Music\*"
    #LS_COMMON="$LS_COMMON -I Pictures\*"
    #LS_COMMON="$LS_COMMON -I Start\ Menu\*"
    #LS_COMMON="$LS_COMMON -I Application\ Data\*"
    #LS_COMMON="$LS_COMMON -I Local\ Settings\*"
    #LS_COMMON="$LS_COMMON -I Cookies\*"
    #LS_COMMON="$LS_COMMON -I ntuser.ini"
    #LS_COMMON="$LS_COMMON -I ntuser.pol"
    #LS_COMMON="$LS_COMMON -I Thumbs.db"
    #LS_COMMON="$LS_COMMON -I Favorites\*"
    #LS_COMMON="$LS_COMMON -I Recent\*"
    #LS_COMMON="$LS_COMMON -I Searches\*"
    #LS_COMMON="$LS_COMMON -I Videos\*"
    #LS_COMMON="$LS_COMMON -I Desktop\*"
    #alias ls="command ls $LS_COMMON"
    #alias ll="ls -l"
    #alias la="ls -al"
    alias la='ls -alh --color=always --ignore=ntuser*'
else
    alias la='ls -alh'
fi

if [[ "$OSTYPE" == "cygwin" ]] ; then
    alias gvim='/cygdrive/d/Vim/vim74/gvim.exe'
fi

alias ls='ls --color=auto'

if [[ "$OSTYPE" == "linux-gnu" ]] ; then
    #PS1='[\u@\h \W]\$ '
    archey3
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

alias rdesktop='rdesktop -g 95% -P -z -x l -r sound:off -u Administrator '
alias rdchome='rdesktop -g 95% -P -z -x l -r sound:off -u Administrator hughmediacenter'
alias rdc='rdesktop -g 95% -P -z -x l -r sound:off -u Administrator 192.168.0.1'
alias homeserver='ssh Administrator@hughmediacenter'
alias sudo='sudo '
alias tda='cd /d/Dropbox/Projects/tda/'
alias e='/Applications/Emacs.app/Contents/MacOS/Emacs'
alias eixt='exit'


alias gotowork='~/Dev/djangobox/'
#alias tmux='tmux -2'
alias pac='sudo pacman -S '




