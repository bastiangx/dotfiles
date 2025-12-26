##
## Plugins
##

# Configure and load plugins using Zinit's
ZINIT_HOME="${ZINIT_HOME:-${XDG_DATA_HOME:-${HOME}/.local/share}/zinit}"

# Added by Zinit's installer
if [[ ! -f ${ZINIT_HOME}/zinit.git/zinit.zsh ]]; then
    print -P "%F{14}▓▒░ Installing Flexible and fast ZSH plugin manager %F{13}(zinit)%f"
    command mkdir -p "${ZINIT_HOME}" && command chmod g-rwX "${ZINIT_HOME}"
    command git clone https://github.com/zdharma-continuum/zinit.git "${ZINIT_HOME}/zinit.git" && \
        print -P "%F{10}▓▒░ Installation successful.%f%b" || \
        print -P "%F{9}▓▒░ The clone has failed.%f%b"
fi

source "${ZINIT_HOME}/zinit.git/zinit.zsh"

zinit ice blockf atpull'zinit creinstall -q .'
zinit light zsh-users/zsh-completions

autoload compinit
compinit

zinit light-mode for \
  hlissner/zsh-autopair \
  zdharma-continuum/fast-syntax-highlighting \
  MichaelAquilina/zsh-you-should-use \
  zsh-users/zsh-autosuggestions \
  Aloxaf/fzf-tab

zinit ice wait'3' lucid
zinit light zsh-users/zsh-history-substring-search

zinit ice wait'2' lucid
zinit light zdharma-continuum/history-search-multi-word

# BAT
zinit ice wait lucid from"gh-r" as"program" mv"*/bat -> bat" atload"export BAT_THEME='Nord'"
zinit light sharkdp/bat

# =============================================================================
# CARAPACE COMPLETION SYSTEM
# =============================================================================
# Install with: brew install carapace
# Provides intelligent completions for external commands
if command -v carapace &> /dev/null; then
    # Initialize carapace for zsh with bridge support
    source <(carapace _carapace zsh)
    
    # Custom completer for UV
    _uv_completer() {
        local words=(--query "$words[2]")
        local suggestions=(
            "auth:Manage authentication"
            "run:Run a command or script" 
            "init:Create a new project"
            "add:Add dependencies to project"
            "remove:Remove dependencies from project"
            "version:Read or update project's version"
            "sync:Update project's environment"
            "lock:Update project's lockfile"
            "export:Export project's lockfile to an alternate format"
            "tree:Display project's dependency tree"
            "format:Format Python code in project"
            "tool:Run and install commands provided by Python packages"
            "python:Manage Python versions and installations"
            "pip:Manage Python packages with a pip-compatible interface"
            "venv:Create a virtual environment"
        )
        
        compadd -d suggestions
    }
    
    # Override UV completion if available
    compdef _uv_completer uv 2>/dev/null || true
fi

# =============================================================================
# ZOXIDE (Better cd command)
# =============================================================================
eval "$(zoxide init zsh)"

# nerdfetch on launch
nerdfetch-rs

# vim:ft=zsh
