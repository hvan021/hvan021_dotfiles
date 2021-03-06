# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
source $HOME/.bash_profile

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell"
ZSH_THEME="agnoster"
#ZSH_THEME_RANDOM_CANDIDATES=(
  #"robbyrussell"
  #"agnoster"
#)
#ZSH_THEME="random" # (...please let it be pie... please be some pie..)
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#  alias ll="ls -al"
# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to disable command auto-correction.
# DISABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)


# User configuration

#export PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:/usr/local/mysql/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#    if [[ $OSTYPE == "darwin"* ]]; then
#        export EDITOR='mvim'
#    fi
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

## Huy's settings
plugins=(git python3 colored-man-pages zsh-autosuggestions zsh-syntax-highlighting )

#source $HOME/.bash_exports
#source $ZSH/oh-my-zsh.sh

source $ZSH/oh-my-zsh.sh
setopt nocorrectall

#source $HOME/.bash_aliases
#export POWERLINE_COMMAND=~/Library/Python/2.7/lib/bin/powerline

#if [[ $OSTYPE == "darwin"* ]]; then
    #path+=( ~/Library/Python/3.7/bin )
    #. ~/Library/Python/3.7/lib/python/site-packages/powerline/bindings/zsh/powerline.zsh
#elif [[ -r ~/.local/lib/python3.4/site-packages/powerline/bindings/zsh/powerline.zsh ]]; then
    #source ~/.local/lib/python3.4/site-packages/powerline/bindings/zsh/powerline.zsh
#fi

# virtualenvwrapper settings
# 22/04/2019 fix python & virtualenv after brew upgrade
#if [ -f /usr/local/bin/virtualenvwrapper.sh ]; then
    #export WORKON_HOME=$HOME/.virtualenvs
    #export PROJECT_HOME=$HOME/Dev
    #source /usr/local/bin/virtualenvwrapper.sh
#fi

# powerline style prompt
# 22/04/2019 fix powerline after brew upgrade
powerline-daemon -q
. /usr/local/lib/python3.8/site-packages/powerline/bindings/zsh/powerline.zsh



# set color for iterm

#if [ -e /usr/share/terminfo/x/xterm-256color ]; then
        #export TERM='xterm-256color'
#else
        #export TERM='xterm-color'
#fi

if [ -f "/etc/arch-release" ] ; then
    [[ -z $DISPLAY && $XDG_VTNR -eq 1 ]] && exec startx
fi


bindkey -v


#bindkey '^P' up-history
#bindkey '^N' down-history
#bindkey '^?' backward-delete-char
#bindkey '^h' backward-delete-char
#bindkey '^w' backward-kill-word
#bindkey '^r' history-incremental-search-backward

#function zle-line-init zle-keymap-select {
    #VIM_PROMPT="%{$fg_bold[yellow]%} [% NORMAL]%  %{$reset_color%}"
    #RPS1="${${KEYMAP/vicmd/$VIM_PROMPT}/(main|viins)/}$(git_custom_status) $EPS1"
    #zle reset-prompt
#}

#zle -N zle-line-init
#zle -N zle-keymap-select
export KEYTIMEOUT=1

export PATH="/usr/local/sbin:$PATH"

#source /Users/huy/.config/broot/launcher/bash/br

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh" || true

