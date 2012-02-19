# If not running interactively, don't do anything
[[ "$-" != *i* ]] && return

# Enable vi mode
set -o vi
export EDITOR=vim

# Aliases
source ~/.dotfiles/bash_aliases

# Local aliases / configuration
if [ -f ~/.bash_aliases_local ]; then
  source ~/.bash_aliases_local
fi

if [ -f ~/.bashrc_local ]; then
  source ~/.bashrc_local
fi

# Wizbang prompt with GIT bits
if [ $UID -eq 0 ]; then
  export PS1='\[\033[35m\]\t\[\033[m\]-\[\033[31m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\[\033[32m\]$(__git_ps1) \[\033[0m\]$ ' 
else
  export PS1='\[\033[35m\]\t\[\033[m\]-\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\[\033[m\]\[\033[32m\]$(__git_ps1) \[\033[0m\]$ ' 
fi
export PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD} $(__git_ps1)\007"'

# Include per-user bin folder in path
export PATH=$PATH:~/bin:~/.dotfiles/bin

# Todo.TXT
if [ -f ~/.todo/todo.txt ]; then
  export TODOTXT_CFG_FILE=~/.dotfiles/todo.cfg
  export TODOTXT_VERBOSE=0
  alias t="todo.sh -c" 
  alias tl="t list"
  alias ta="t add"
  alias td="t do"
  todo.sh -c list 
fi

# Add git autocompletion goodness
source ~/.dotfiles/bin/git-completion.sh

# RVM
if [ -f /usr/local/rvm/scripts/rvm ]; then
  [[ -s "/usr/local/rvm/scripts/rvm" ]] && source "/usr/local/rvm/scripts/rvm" # Load RVM into a shell session *as a function*
  rvm use 1.9.3 > /dev/null
fi

# SSH Keychain
if [ -f /usr/bin/keychain ]; then
  if [ -f ~/.ssh/id_dsa ]; then
    /usr/bin/keychain -q ~/.ssh/id_dsa
    source .keychain/`hostname`-sh
  fi
fi
