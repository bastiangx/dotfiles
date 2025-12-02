### Aliases for nushell ###

### custom global todo
alias to = nvim ~/code/todo.md
alias td = nvim ~/code/todo.md

alias cl = clear
alias py = uv python
alias pip = uv pip
alias top = btop
alias wget = wget2
# tree gitignore and colorise
alias tree = tree --gitignore -C

## Yazi file manager
alias y = yazi

## Neovim
alias v = nvim
alias vim = nvim
# run nvim in sudo -E, --BE CAREFUL USING THIS--
#--BE CAREFUL USING THIS--#
alias svim = sudo -E /usr/bin/nvim .

## Cursor
alias c = cursor
# cursor-agent [https://cursor.com/en/blog/cli]
alias ai = cursor-agent 

## Bun
alias bb = bun run build
alias bd = bun run dev
alias bt = bun run test
alias ba = bun add

## Doppler secret manager
alias dp = doppler

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
alias l = lazygit

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
