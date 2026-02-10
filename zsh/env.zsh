##
## PATH & ENV Var
##

# Go configuration
export GOROOT="/opt/homebrew/opt/go/libexec"
export GOPATH="$HOME/go"
export PATH="$GOROOT/bin:$GOPATH/bin:$PATH"

export PNPM_HOME="$HOME/.local/share/pnpm"
export PATH="$HOME/.spicetify:$PATH"
export PATH="$PNPM_HOME:$PATH"
export PATH="$HOME/.scripts:$PATH"
export PATH="$HOME/.local/bin:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

# Zerobrew
export PATH="/opt/zerobrew/bin:$PATH"
export PATH="/opt/zerobrew/prefix/bin:$PATH"
export PATH="/opt/homebrew/bin:$PATH"
export PATH="/opt/homebrew/sbin:$PATH"

# Homebrew specific tools
export PATH="/opt/homebrew/opt/curl/bin:$PATH"
export PATH="/opt/homebrew/opt/postgresql@16/bin:$PATH"
# Go configuration
export GOROOT="/opt/homebrew/opt/go/libexec"
export GOPATH="$HOME/go"
export PATH="$GOROOT/bin:$GOPATH/bin:$PATH"
export GPG_TTY="${TTY:-$(tty)}"

export SUDO_PROMPT="passwd: "
export TERMINAL="wezterm"
export BROWSER="firefox"
export VISUAL="nvim"
export EDITOR="nvim"

# Tool configurations
export BAT_THEME="Catppuccin Mocha"
export STARSHIP_CONFIG="$HOME/dotfiles/starship/starship.toml"
export GHOSTTY_RESOURCES_DIR="$HOME/.config/ghostty"
export CARAPACE_BRIDGES="zsh,fish,bash,inshellisense"
export CARAPACE_MATCH="1"
export ATUIN_NOBIND="true"
export MISE_SHELL="zsh"

export XDG_CONFIG_HOME="$HOME/.config"
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_STATE_HOME="$HOME/.local/state"
export XDG_CONFIG_DIRS="/etc/xdg"
export XDG_DATA_DIRS="/usr/local/share:/usr/share:/var/lib/flatpak/exports/share:$XDG_DATA_HOME/flatpak/exports/share"
# Set XDG_RUNTIME_DIR based on OS
if [[ "$OSTYPE" == "darwin"* ]]; then
  # macOS specific configuration
  export XDG_RUNTIME_DIR="/tmp/user-$(id -u)"
  # Create the directory if it doesn't exist
  if [[ ! -d "$XDG_RUNTIME_DIR" ]]; then
    mkdir -p "$XDG_RUNTIME_DIR"
    chmod 700 "$XDG_RUNTIME_DIR"
  fi
else
  # Linux and other systems
  export XDG_RUNTIME_DIR="/run/user/$(id -u)"
fi
export XDG_DESKTOP_DIR="$HOME/Desktop"
export XDG_DOWNLOAD_DIR="$HOME/Downloads"
export XDG_TEMPLATES_DIR="$HOME/Templates"
export XDG_PUBLICSHARE_DIR="$HOME/Public"
export XDG_DOCUMENTS_DIR="$HOME/Documents"
export XDG_MUSIC_DIR="$HOME/Music"
export XDG_PICTURES_DIR="$HOME/Pictures"
export XDG_VIDEOS_DIR="$HOME/Videos"

## Comment this to use normal manpager
export MANPAGER='nvim +Man! +"set nocul" +"set noshowcmd" +"set noruler" +"set noshowmode" +"set laststatus=0" +"set showtabline=0" +"set nonumber"'

if [ $(echo $MANPAGER | awk '{print $1}') = nvim ]; then
  export LESS="--RAW-CONTROL-CHARS"
  export MANPAGER="less -s -M +Gg"

  export LESS_TERMCAP_mb=$'\e[1;32m'
  export LESS_TERMCAP_md=$'\e[1;32m'
  export LESS_TERMCAP_me=$'\e[0m'
  export LESS_TERMCAP_se=$'\e[0m'
  export LESS_TERMCAP_so=$'\e[01;33m'
  export LESS_TERMCAP_ue=$'\e[0m'
  export LESS_TERMCAP_us=$'\e[1;4;31m'
fi

# FZF bases
export FZF_DEFAULT_OPTS="
  --color fg:#cdd6f4
  --color fg+:#cdd6f4
  --color bg+:#313244
  --color hl:#f38ba8
  --color hl+:#f38ba8
  --color info:#cba6f7
  --color prompt:#cba6f7
  --color spinner:#f5e0dc
  --color pointer:#f5e0dc
  --color marker:#f5e0dc
  --color border:#1e1e2e
  --color header:#f38ba8
  --prompt ' '
  --pointer ' λ'
  --layout=reverse
  --border horizontal
  --height 40"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# Elixir
export ELIXIR_INSTALL="$HOME/.elixir-install"
export PATH="$ELIXIR_INSTALL/installs/elixir/1.19.0-otp-28/bin:$PATH"
export PATH="$ELIXIR_INSTALL/installs/otp/28.1/erts-16.1/bin:$PATH"

# =============================================================================
# LS_COLORS - Catppuccin theme
# =============================================================================
export LS_COLORS="ow=30;44:st=30;44:di=38;5;61:ln=38;5;211:ex=38;5;61"
export LSCOLORS="fxexexexcxexexdxgxgxbxcxcx"

# keep PATH/exports above this line
[[ -o interactive ]] || return

# Ghostty integration
if [[ -n "${GHOSTTY_ZSH_ZDOTDIR+X}" ]]; then
    'builtin' 'export' ZDOTDIR="$GHOSTTY_ZSH_ZDOTDIR"
    'builtin' 'unset' 'GHOSTTY_ZSH_ZDOTDIR'
else
    'builtin' 'unset' 'ZDOTDIR'
fi

# Use try-always to have the right error code.
{
    # Zsh treats empty $ZDOTDIR as if it was "/". We do the same.
    #
    # Source the user's zshenv before sourcing ghostty.zsh because the former
    # might set fpath and other things without which ghostty.zsh won't work.
    #
    # Use typeset in case we are in a function with warn_create_global in
    # effect. Unlikely but better safe than sorry.
    'builtin' 'typeset' _ghostty_file=${ZDOTDIR-~}"/.zshenv"
    # Zsh ignores unreadable rc files. We do the same.
    # Zsh ignores rc files that are directories, and so does source.
    [[ ! -r "$_ghostty_file" ]] || 'builtin' 'source' '--' "$_ghostty_file"
} always {
    if [[ -o 'interactive' ]]; then
        'builtin' 'autoload' '--' 'is-at-least'
        'is-at-least' "5.1" || {
            builtin echo "ZSH ${ZSH_VERSION} is too old for ghostty shell integration" > /dev/stderr
            return
        }
        # ${(%):-%x} is the path to the current file.
        # On top of it we add :A:h to get the directory.
        'builtin' 'typeset' _ghostty_file="${${(%):-%x}:A:h}"/ghostty-integration
        if [[ -r "$_ghostty_file" ]]; then
            'builtin' 'autoload' '-Uz' '--' "$_ghostty_file"
            "${_ghostty_file:t}"
            'builtin' 'unfunction' '--' "${_ghostty_file:t}"
        fi
    fi
    'builtin' 'unset' '_ghostty_file'
}

# bun completions
[ -s "/home/bast/.bun/_bun" ] && source "/home/bast/.bun/_bun"
