# Set user-defined locale
export LANG=$(locale -uU)

# source the users bashrc if it exists
if [ -f "${HOME}/.bashrc" ] ; then
  source "${HOME}/.bashrc"
fi

# Hack so that I can startup a cygwin session in a particular place
if [ -n "$SHELLHERE_PATH" ]; then
  cd "`cygpath -u "$SHELLHERE_PATH"`"
fi
unset SHELLHERE_PATH

