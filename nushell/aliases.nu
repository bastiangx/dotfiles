
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

# FZF helpers

# Use macOS BSD find switches
alias fzf-f = command find . -type f | fzf --height 40% --border --preview 'bat --style=numbers --color=always {} || cat {}'
alias fzf-w = rg --files-with-matches --hidden --ignore .git | fzf --height 60% --border --preview 'bat --style=numbers --color=always {} || cat {}'
alias fzf-all = command find ~ \( -path "/Users/bast/cache" -o -path "/Users/bast/temp" \) -prune -o -type f -print | fzf --height 50% --border --preview 'bat --style=numbers --color=always {} || cat {}'
alias fzf-a = command find ~ \( -path "/Users/bast/cache" -o -path "/Users/bast/temp" \) -prune -o -type f -print | fzf --height 50% --border --preview 'bat --style=numbers --color=always {} || cat {}'

