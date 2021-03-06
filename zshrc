# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

ZSH_THEME="clean"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

HIST_STAMPS="yyyy-mm-dd"

plugins+=(git golang sublime)

# use zsh-nvm if it's installed
# git clone https://github.com/lukechilds/zsh-nvm ~/.oh-my-zsh/custom/plugins/zsh-nvm
if [ -d ~/.oh-my-zsh/custom/plugins/zsh-nvm ]; then
  export NVM_LAZY_LOAD=true
  plugins+=(zsh-nvm)
fi

# User configuration

export PATH="$HOME/bin:/usr/lib/git-core:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/home/jsc/.dotfiles/bin"

# if local zshrc exists, source it.
if [ -f ~/.zshrc_local ]; then
  source ~/.zshrc_local
fi

export LANG=en_US.UTF-8
export EDITOR='vim'

# vi bindings
bindkey -v

function laststatus {
  return $?
}

if [ -f "${HOME}/.gpg-agent-info" ]; then
     . "${HOME}/.gpg-agent-info"
       export GPG_AGENT_INFO
       export SSH_AUTH_SOCK
       export SSH_AGENT_PID
fi

# if keychain is installed, start it up assuming the usual key 
# types.  Only for non-root.
if [[ $EUID -ne 0 ]]; then
  which keychain >> /dev/null
  if laststatus; then
    eval `keychain -q --eval --agents ssh id_ed25519 id_rsa`
  fi 
fi

source $ZSH/oh-my-zsh.sh