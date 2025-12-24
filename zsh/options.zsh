##
## ZSH Options
##

umask 022
zmodload zsh/zle
zmodload zsh/zpty
zmodload zsh/complist

autoload _vi_search_fix
autoload -Uz colors
autoload -U compinit
colors

zle -N _vi_search_fix
zle -N _sudo_command_line

# Completion
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

# History
HISTFILE="$XDG_CACHE_HOME/.zhistory"
HISTSIZE=10000
SAVEHIST=10000

# Autosuggestion
ZSH_AUTOSUGGEST_USE_ASYNC="true"
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor regexp root line)
ZSH_HIGHLIGHT_MAXLENGTH=512
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=$color8,bold"

while read -r opt
do 
  setopt $opt
done <<-EOF
AUTOCD
AUTO_MENU
AUTO_PARAM_SLASH
COMPLETE_IN_WORD
NO_MENU_COMPLETE
HASH_LIST_ALL
ALWAYS_TO_END
NOTIFY
NOHUP
MAILWARN
INTERACTIVE_COMMENTS
NOBEEP
APPEND_HISTORY
SHARE_HISTORY
INC_APPEND_HISTORY
EXTENDED_HISTORY
HIST_IGNORE_ALL_DUPS
HIST_IGNORE_SPACE
HIST_NO_FUNCTIONS
HIST_EXPIRE_DUPS_FIRST
HIST_SAVE_NO_DUPS
HIST_REDUCE_BLANKS
EOF

while read -r opt
do 
  unsetopt $opt
done <<-EOF
FLOWCONTROL
NOMATCH
CORRECT
EQUALS
EOF

command -v zoxide &>/dev/null && eval "$(zoxide init zsh)"

# =============================================================================
# FNM (Fast Node Manager) with auto-switching
# =============================================================================
# Automatically switches Node versions when entering directories with .nvmrc or .node-version
if command -v fnm &>/dev/null; then
    eval "$(fnm env --use-on-cd)"
    
    # Hook for automatic version switching
    autoload -U add-zsh-hook
    _fnm_autoload_hook() {
        if [[ -f .nvmrc || -f .node-version ]]; then
            fnm use --silent-if-unchanged 2>/dev/null
        fi
    }
    add-zsh-hook chpwd _fnm_autoload_hook
    
    # Run on initial shell load
    _fnm_autoload_hook
fi 

# Set editor default keymap to emacs (`-e`) or vi (`-v`)
bindkey -v

# OCaml Package Manager
eval $(opam env)

# vim:filetype=zsh:nowrap
