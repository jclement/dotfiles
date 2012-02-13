# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Aliases
source ~/.dotfiles/.bash_aliases

if [ -f ~/.bash_aliases_local ]; then
  source ~/.bash_aliases_local
fi

# Wizbang prompt with GIT bits
export PS1='\[\033[35m\]\t\[\033[m\]-\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\[\033[32m\]$(__git_ps1) \[\033[0m\]$ ' 
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD} $(__git_ps1)\007"'

# Include per-user bin folder in path
export PATH=$PATH:~/bin

# Add git autocompletion goodness
source ~/.dotfiles/bin/git-completion.sh
