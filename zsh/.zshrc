## ░▀▀█░█▀▀░█░█░█▀▄░█▀▀
## ░▄▀░░▀▀█░█▀█░█▀▄░█░░
## ░▀▀▀░▀▀▀░▀░▀░▀░▀░▀▀▀
##
## rxyhn's Z-Shell configuration
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
