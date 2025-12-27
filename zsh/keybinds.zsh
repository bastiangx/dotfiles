##
## Keybindings
##

bindkey -v

# History search
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# Home/End keys for beginning/end of line
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

# Fix backspace and delete in vi-mode (CRITICAL for usability)
bindkey -M viins "^?" backward-delete-char
bindkey -M viins "^H" backward-delete-char
bindkey -M viins "^U" backward-kill-line
bindkey -M viins "^W" backward-kill-word

# Allow v to edit the command line in vim
bindkey -M vicmd 'v' edit-command-line

# Make Vi mode transitions faster (no delay)
export KEYTIMEOUT=1

# vim:ft=zsh:nowrap
