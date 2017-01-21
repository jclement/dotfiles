# source: http://b.z19r.com/post/getting-gpg-git-signing-working-with-fish-shell

gpg-agent --daemon --enable-ssh-support --write-env-file $HOME/.gpg-agent-info 2> /dev/null > /dev/null

if test -e "$HOME/.gpg-agent-info"
     set arrayName (cat "$HOME/.gpg-agent-info")
     for line in $arrayName
         set environment_var (echo $line | cut -d'=' -f1)
         set environment_val (echo $line | cut -d'=' -f2)
         set -x $environment_var $environment_val
    end
end

set -x GPG_TTY (tty)