### ZSH CONFIGURATION ###

# starship.rs prompt setup
export STARSHIP_SHELL=~/.config/starship.toml
eval "$(starship init zsh)"

# ZINIT plugin manager setup
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# dl zinit if not installed
if [ ! -d $ZINIT_HOME ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# load zinit
source "${ZINIT_HOME}/zinit.zsh"


### zinit Plugins ###

# syntax highlighting
zinit light zsh-users/zsh-syntax-highlighting
# auto complete
zinit light zsh-users/zsh-completions
# auto suggestions
zinit light zsh-users/zsh-autosuggestions
# autoload completions 
autoload -U compinit && compinit


### HISTORY ##

HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups


### KEYBINDINGS ###

bindkey -v
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward


### ZSTYLE ###

# zstyle case insensitive
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# zstyle lists colored
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"

### ALIAS ### 
# alias source zsh
alias src="source ~/.zshrc"

# alias ls coloring
alias ls="ls --color"

# alias apt stuff 
alias update="sudo apt update"
alias upgrade="sudo apt upgrade"
alias install="sudo apt install"
alias remove="sudo apt remove"
alias purge="sudo apt purge"

# alias open .zshrc 
alias zshrc="nvim ~/.zshrc"

# alias file manager / nautilus
alias fm="nautilus . &>/dev/null & disown"

# alias new warp terminal
alias warp="/usr/bin/warp-terminal &>/dev/null & disown"
alias term="/usr/bin/warp-terminal &>/dev/null & disown"

# alias python
alias py="python3"
alias pip="pip3"

# alias nvim shortcuts
alias vim="nvim"
alias vi="nvim"
alias nv="nvim"

# alias nvim in sudo -E
alias svim="sudo -E  /opt/nvim/bin/nvim ."

# alias for kotlinc and jar
alias kotlinc="kotlinc -include-runtime -d"
alias jar="java -jar"

# alias for android studio
alias android="/opt/google/android-studio/studio-app/bin/studio.sh &>/dev/null & disown"


### PATHFINDERS ###

# nvim path
export PATH="$PATH:/opt/nvim/bin"

# Zoxide setup - better cd commands
eval "$(zoxide init zsh)"

# rustup/cargo setup
export PATH="$PATH:/home/jupiterus/.cargo/bin"

# Java & gradle setup
export JAVA_HOME=/usr/lib/jvm/jdk-22-oracle-x64
export PATH=$JAVA_HOME/bin:$PATH

# Android studio setup
export ANDROID_HOME=/opt/google/android-studio/studio-app/bin/ 
export PATH=$ANDROID_HOME:$PATH

# Node manager 
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
