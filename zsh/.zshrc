
## ░▀▀█░█▀▀░█░█░█▀▄░█▀▀
## ░▄▀░░▀▀█░█▀█░█▀▄░█░░
## ░▀▀▀░▀▀▀░▀░▀░▀░▀░▀▀▀
##
## https://github.com/rxyhn

# =============================================================================
# LOAD CORE CONFIGURATION MODULES
# =============================================================================
while read file
do
  source "$HOME/dotfiles/zsh/$file.zsh"
done <<-EOF
env
theme-switcher
theme
aliases
utility
options
plugins
atuin
keybinds
prompt
EOF

# =============================================================================
# EXTERNAL COMPLETIONS
# =============================================================================
# bun completions
[ -s "/home/bast/.bun/_bun" ] && source "/home/bast/.bun/_bun"

# opam configuration (OCaml package manager)
[[ ! -r '/Users/bast/.opam/opam-init/init.zsh' ]] || source '/Users/bast/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null

# =============================================================================
# ADDITIONAL PATH & ENVIRONMENT
# =============================================================================
export NU_CONFIG_DIR="$HOME/.config/nushell"
export GOROOT=/opt/homebrew/opt/go/libexec
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# =============================================================================
# SECRETS (loaded last to override any defaults)
# =============================================================================
if [ -f "$HOME/dotfiles/secrets.zsh" ]; then
  source "$HOME/dotfiles/secrets.zsh"
fi

if [ -f "$HOME/dotfiles/zsh/.secrets.zsh" ]; then
  source "$HOME/dotfiles/zsh/.secrets.zsh"
fi
