# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{bash_extra,bash_prompt,bash_exports,bash_aliases,bash_functions,bash_completion}; do
    [ -r "$file" ] && source "$file"
done
unset file

if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

if [ -d "$HOME/.local/bin" ] ; then 
    PATH="$HOME/.local/bin:$PATH"
fi

if [ -d "/usr/local/mysql/bin" ] ; then
    export PATH="/usr/local/mysql/bin:$PATH"
fi

if [ -d "/home/huy/.gem/ruby/2.1.0/bin" ] ; then
    export PATH="/home/huy/.gem/ruby/2.1.0/bin:$PATH"
fi
# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
#export PATH="/usr/local/bin:$PATH"


if [[ $OSTYPE == "darwin"* ]] ; then
    alias showFiles='defaults write com.apple.finder AppleShowAllFiles YES; killall Finder /System/Library/CoreServices/Finder.app'
    alias hideFiles='defaults write com.apple.finder AppleShowAllFiles NO; killall Finder /System/Library/CoreServices/Finder.app'
    #alias vim='mvim'
   #alias vim='vim -v'
fi

export EDITOR=vim
export CLICOLOR=1

# DO NOT USE THIS AUTOSTART TMUX -- CAUSE Xorg to fail on "no console users allowed..."
# If not running interactively, do not do anything
# [[ $- != *i* ]] && return
# [[ -z "$TMUX" ]] && exec tmux

# TMUX
#if which tmux >/dev/null 2>&1; then
    #if not inside a tmux session, and if no session is started, start a new session
#    test -z "$TMUX" && (tmux attach || tmux new-session)
#fi

export GTK_IM_MODULE=ibus
export XMODIFIERS=@im=ibus
export QT_IM_MODULE=ibus


if [[ $OSTYPE == "darwin"* ]] ; then
    fortune | cowsay 
else
    fortune ~/myquote | cowsay | lolcat
fi
