# Baseball Fun Facts

BBFF_PLUGIN_DIR=${0:h}

() {
local DIR=$BBFF_PLUGIN_DIR/fortunes
if [[ ! -f $DIR/bbff.dat ]] || [[ $DIR/bbff.dat -ot $DIR/bbff ]]; then
  # For some reason, Cygwin puts strfile in /usr/sbin, which is not on the path by default
  local strfile=strfile
  if ! which strfile &>/dev/null && [[ -f /usr/sbin/strfile ]]; then
    strfile=/usr/sbin/strfile
  fi
  if which $strfile &> /dev/null; then
    $strfile $DIR/bbff $DIR/bbff.dat >/dev/null
  else
    echo "[oh-my-zsh] bbff depends on strfile, which is not installed" >&2
    echo "[oh-my-zsh] strfile is often provided as part of the 'fortune' package" >&2
  fi
fi

# Aliases
alias bbff="fortune -a $DIR"
alias bbff_cow="bbff | cowthink"
}

unset BBFF_PLUGIN_DIR