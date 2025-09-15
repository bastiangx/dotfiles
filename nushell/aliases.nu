### Aliases for nushell

alias c = clear
alias py = python3
alias top = btop
alias wget = wget2
# tree gitignore and colorise
alias tree = tree --gitignore -C

## Neovim
alias v = nvim
alias vim = nvim
# run nvim in sudo -E, --BE CAREFUL USING THIS--
#--BE CAREFUL USING THIS--#
alias svim = sudo -E /usr/bin/nvim .

# Bun
alias bb = bun run build
alias bd = bun run dev

# Git
alias g = git
alias gs = git status
alias ga = git add
alias gc = git commit
alias gp = git push
alias gpl = git pull
alias gl = git log
alias gd = git diff
alias gb = git branch
alias gco = git checkout
alias gcl = git clone
alias gm = git merge
# Lazygit [https://github.com/jesseduffield/lazygit]
alias lg = lazygit

## Brew
alias b = brew
alias bl = brew list
alias bs = brew search
alias bu = brew update
alias bg = brew upgrade
alias bi = brew install
alias br = brew remove

## Clipboard plugin (copy-paste in JSON)
# [https://github.com/FMotalleb/nu_plugin_clipboard]
# Used script to install: $`plugin add ~/.cargo/bin/nu_plugin_clipboard`
alias cc = clipboard copy
alias cv = clipboard paste


## Podman
# podman-tui [https://github.com/containers/podman-tui]
alias pot = podman-tui
# podman-compose [https://github.com/containers/podman-compose]
alias poc = podman-compose
