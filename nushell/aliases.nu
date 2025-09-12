
# alias ls = eza -ah --no-user --no-time --git --icons --color always
alias c = clear
alias py = python3
alias top = btop
alias wget = wget2

# nvim
alias v = nvim
alias vim = nvim
# runs nvim in sudo -E, BE CAREFUL USING THIS
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

alias lg = lazygit

## Clipboard plugin (copy-paste in JSON)
## See https://github.com/FMotalleb/nu_plugin_clipboard
## used $ `plugin add ~/.cargo/bin/nu_plugin_clipboard`
alias cc = clipboard copy
alias cv = clipboard paste

# tree always uses gitignore and colorise
alias tree = tree --gitignore -C
