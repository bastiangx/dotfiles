
## ░▀▀█░█▀▀░█░█░█▀▄░█▀▀
## ░▄▀░░▀▀█░█▀█░█▀▄░█░░
## ░▀▀▀░▀▀▀░▀░▀░▀░▀░▀▀▀
##
## https://github.com/rxyhn

while read file
do
  source "$HOME/dotfiles/zsh/$file.zsh"
done <<-EOF
theme
env
aliases
utility
options
plugins
keybinds
prompt
EOF

# bun completions
[ -s "/home/bast/.bun/_bun" ] && source "/home/bast/.bun/_bun"


# BEGIN opam configuration
# This is useful if you're using opam as it adds:
#   - the correct directories to the PATH
#   - auto-completion for the opam binary
# This section can be safely removed at any time if needed.
[[ ! -r '/Users/bast/.opam/opam-init/init.zsh' ]] || source '/Users/bast/.opam/opam-init/init.zsh' > /dev/null 2> /dev/null
# END opam configuration

export NU_CONFIG_DIR="$HOME/.config/nushell"
export GOROOT=/opt/homebrew/opt/go/libexec
export GOPATH=$HOME/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin

# Secrets
if [ -f "$HOME/dotfiles/secrets.zsh" ]; then
  source "$HOME/dotfiles/secrets.zsh"
fi

if [ -f "$HOME/dotfiles/zsh/.secrets.zsh" ]; then
  source "$HOME/dotfiles/zsh/.secrets.zsh"
fi
