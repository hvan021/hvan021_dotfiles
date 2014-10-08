# Load ~/.extra, ~/.bash_prompt, ~/.exports, ~/.aliases and ~/.functions
# ~/.extra can be used for settings you don’t want to commit
for file in ~/.{bash_extra,bash_prompt,bash_exports,bash_aliases,bash_functions,bash_completion}; do
    [ -r "$file" ] && source "$file"
done
unset file

#if [ -d "$HOME/bin" ] ; then
#  PATH="$HOME/bin:$PATH"
#fi


