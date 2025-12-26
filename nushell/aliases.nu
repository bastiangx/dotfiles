### Aliases for nushell ###

## Shell
alias cl = clear          # Clear terminal
alias rm = rm -rf       # Force remove files/directories
alias tree = tree --gitignore -C # Display directory tree
alias top = btop          # System resource monitor
alias dl = lux -m

## Files
alias y = yazi            # Yazi file manager

# Neovim
alias v = nvim            # Launch Neovim
alias vim = nvim          # Launch Neovim
# run nvim in sudo -E,    --BE CAREFUL USING THIS--
alias svim = sudo -E /usr/bin/nvim . # Neovim with sudo permissions

# Cursor
alias c = cursor          # Launch Cursor IDE

## Version Control
# Git
alias g = git             # Git base command
alias gs = git status     # Git status
alias ga = git add        # Git add
alias gc = git commit     # Git commit
alias gp = git push       # Git push
alias gpl = git pull      # Git pull
alias gl = git log        # Git log
alias gd = git diff       # Git diff
alias gb = git branch     # Git branch
alias gco = git checkout  # Git checkout
alias gcl = git clone     # Git clone
alias gm = git merge      # Git merge

alias l = lazygit
alias lg = lazygit   # Launch Lazygit

## Package Management
# Brew
def bu [] { brew update; brew upgrade }    # Update brew
alias bg = brew upgrade                    # Upgrade brew packages

# Python (using uv for perf)
alias python = uv run python
alias py = uv run python  # Python runtime with uv
alias pip = uv pip        # Python package manager with uv

# Bun
alias bb = bun run build  # Bun build command
alias bd = bun run dev    # Bun development server
alias bt = bun run test   # Bun test command
alias ba = bun add        # Bun add package
alias br = bun run        # Bun add package

# Podman
# podman-tui [https://github.com/containers/podman-tui]
alias pot = podman-tui    # Podman TUI
# podman-compose [https://github.com/containers/podman-compose]
alias poc = podman-compose # Podman Compose

alias dp = doppler        # Doppler secret manager
alias op = opencode       # Opencode TUI

# Custom Global Todo file
alias to = nvim ~/code/todo.md
alias td = nvim ~/code/todo.md
alias note = nvim ~/Documents/notes.md

# Clipboard plugin [https://github.com/FMotalleb/nu_plugin_clipboard]
# Used script to install: $`plugin add ~/.cargo/bin/nu_plugin_clipboard`
alias cc = clipboard copy # Copy to clipboard
alias cv = clipboard paste # Paste from clipboard
