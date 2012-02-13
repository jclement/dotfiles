# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

alias gst='git status'
alias ll='ls -l'
source ~/.git-completion.sh
export PS1='\[\033[35m\]\t\[\033[m\]-\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\[\033[32m\]$(__git_ps1) \[\033[0m\]$ ' 
