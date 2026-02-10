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

### ZeroBrew

#compdef zb

autoload -U is-at-least

_zb() {
    typeset -A opt_args
    typeset -a _arguments_options
    local ret=1

    if is-at-least 5.2; then
        _arguments_options=(-s -S -C)
    else
        _arguments_options=(-s -C)
    fi

    local context curcontext="$curcontext" state line
    _arguments "${_arguments_options[@]}" : \
'--root=[Root directory for zerobrew data]:ROOT:_files' \
'--prefix=[Prefix directory for linked binaries]:PREFIX:_files' \
'--concurrency=[Number of parallel downloads]:CONCURRENCY:_default' \
'-h[Print help]' \
'--help[Print help]' \
'-V[Print version]' \
'--version[Print version]' \
":: :_zb_commands" \
"*::: :->zb" \
&& ret=0
    case $state in
    (zb)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:zb-command-$line[1]:"
        case $line[1] in
            (install)
_arguments "${_arguments_options[@]}" : \
'--no-link[Skip linking executables]' \
'-h[Print help]' \
'--help[Print help]' \
':formula -- Formula name to install:_default' \
&& ret=0
;;
(uninstall)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
'::formula -- Formula name to uninstall (omit to uninstall all):_default' \
&& ret=0
;;
(migrate)
_arguments "${_arguments_options[@]}" : \
'-y[Skip confirmation prompt]' \
'--yes[Skip confirmation prompt]' \
'--force[Use --force when uninstalling from Homebrew (removes all versions)]' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(list)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(info)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
':formula -- Formula name:_default' \
&& ret=0
;;
(gc)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(reset)
_arguments "${_arguments_options[@]}" : \
'-y[Skip confirmation prompt]' \
'--yes[Skip confirmation prompt]' \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(init)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
&& ret=0
;;
(completion)
_arguments "${_arguments_options[@]}" : \
'-h[Print help]' \
'--help[Print help]' \
':shell -- Shell to generate completions for:(bash elvish fish powershell zsh)' \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
":: :_zb__help_commands" \
"*::: :->help" \
&& ret=0

    case $state in
    (help)
        words=($line[1] "${words[@]}")
        (( CURRENT += 1 ))
        curcontext="${curcontext%:*:*}:zb-help-command-$line[1]:"
        case $line[1] in
            (install)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(uninstall)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(migrate)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(list)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(info)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(gc)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(reset)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(init)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(completion)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
(help)
_arguments "${_arguments_options[@]}" : \
&& ret=0
;;
        esac
    ;;
esac
;;
        esac
    ;;
esac
}

(( $+functions[_zb_commands] )) ||
_zb_commands() {
    local commands; commands=(
'install:Install a formula' \
'uninstall:Uninstall a formula (or all formulas if no name given)' \
'migrate:Migrate all installed Homebrew packages to zerobrew' \
'list:List installed formulas' \
'info:Show info about an installed formula' \
'gc:Garbage collect unreferenced store entries' \
'reset:Reset zerobrew (delete all data for cold install testing)' \
'init:Initialize zerobrew directories with correct permissions' \
'completion:Generate shell completion scripts' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'zb commands' commands "$@"
}
(( $+functions[_zb__completion_commands] )) ||
_zb__completion_commands() {
    local commands; commands=()
    _describe -t commands 'zb completion commands' commands "$@"
}
(( $+functions[_zb__gc_commands] )) ||
_zb__gc_commands() {
    local commands; commands=()
    _describe -t commands 'zb gc commands' commands "$@"
}
(( $+functions[_zb__help_commands] )) ||
_zb__help_commands() {
    local commands; commands=(
'install:Install a formula' \
'uninstall:Uninstall a formula (or all formulas if no name given)' \
'migrate:Migrate all installed Homebrew packages to zerobrew' \
'list:List installed formulas' \
'info:Show info about an installed formula' \
'gc:Garbage collect unreferenced store entries' \
'reset:Reset zerobrew (delete all data for cold install testing)' \
'init:Initialize zerobrew directories with correct permissions' \
'completion:Generate shell completion scripts' \
'help:Print this message or the help of the given subcommand(s)' \
    )
    _describe -t commands 'zb help commands' commands "$@"
}
(( $+functions[_zb__help__completion_commands] )) ||
_zb__help__completion_commands() {
    local commands; commands=()
    _describe -t commands 'zb help completion commands' commands "$@"
}
(( $+functions[_zb__help__gc_commands] )) ||
_zb__help__gc_commands() {
    local commands; commands=()
    _describe -t commands 'zb help gc commands' commands "$@"
}
(( $+functions[_zb__help__help_commands] )) ||
_zb__help__help_commands() {
    local commands; commands=()
    _describe -t commands 'zb help help commands' commands "$@"
}
(( $+functions[_zb__help__info_commands] )) ||
_zb__help__info_commands() {
    local commands; commands=()
    _describe -t commands 'zb help info commands' commands "$@"
}
(( $+functions[_zb__help__init_commands] )) ||
_zb__help__init_commands() {
    local commands; commands=()
    _describe -t commands 'zb help init commands' commands "$@"
}
(( $+functions[_zb__help__install_commands] )) ||
_zb__help__install_commands() {
    local commands; commands=()
    _describe -t commands 'zb help install commands' commands "$@"
}
(( $+functions[_zb__help__list_commands] )) ||
_zb__help__list_commands() {
    local commands; commands=()
    _describe -t commands 'zb help list commands' commands "$@"
}
(( $+functions[_zb__help__migrate_commands] )) ||
_zb__help__migrate_commands() {
    local commands; commands=()
    _describe -t commands 'zb help migrate commands' commands "$@"
}
(( $+functions[_zb__help__reset_commands] )) ||
_zb__help__reset_commands() {
    local commands; commands=()
    _describe -t commands 'zb help reset commands' commands "$@"
}
(( $+functions[_zb__help__uninstall_commands] )) ||
_zb__help__uninstall_commands() {
    local commands; commands=()
    _describe -t commands 'zb help uninstall commands' commands "$@"
}
(( $+functions[_zb__info_commands] )) ||
_zb__info_commands() {
    local commands; commands=()
    _describe -t commands 'zb info commands' commands "$@"
}
(( $+functions[_zb__init_commands] )) ||
_zb__init_commands() {
    local commands; commands=()
    _describe -t commands 'zb init commands' commands "$@"
}
(( $+functions[_zb__install_commands] )) ||
_zb__install_commands() {
    local commands; commands=()
    _describe -t commands 'zb install commands' commands "$@"
}
(( $+functions[_zb__list_commands] )) ||
_zb__list_commands() {
    local commands; commands=()
    _describe -t commands 'zb list commands' commands "$@"
}
(( $+functions[_zb__migrate_commands] )) ||
_zb__migrate_commands() {
    local commands; commands=()
    _describe -t commands 'zb migrate commands' commands "$@"
}
(( $+functions[_zb__reset_commands] )) ||
_zb__reset_commands() {
    local commands; commands=()
    _describe -t commands 'zb reset commands' commands "$@"
}
(( $+functions[_zb__uninstall_commands] )) ||
_zb__uninstall_commands() {
    local commands; commands=()
    _describe -t commands 'zb uninstall commands' commands "$@"
}

if [ "$funcstack[1]" = "_zb" ]; then
    _zb "$@"
else
    compdef _zb zb
fi
