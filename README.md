# Dotfiles

---

my personal linux - nvim - .zshrc configs and dotfiles.

## 🚀 NVChad config

installed via [nvchad](https://nvchad.com/) & [git](https://github.com/NvChad/NvChad)

I have so many custom options and overrides, just search for the word 'custom' if needed.
some default nvchad opts like mappings, plugins, etc. are overridden.

<details open>
<summary>default's override</summary>

- **nvim-cmp**
  - documentation window size limited.
  - completion keywords set to 2.
- **nvim-tree.lua**
  - special files renderer enabled.
  - dotfiels filter enabled.
  - float view enabled with custom width and height.

</details>

---

<details open>
<summary>custom plugins</summary>

- lsp

  - **[filipdutescu/renamer.nvim](https://github.com/filipdutescu/renamer.nvim)** - lsp ranamer.
  - **[LukasPietzschmann/boo.nvim](https://github.com/LukasPietzschmann/boo.nvim)** - LSP companion on steroids.
  - **[nvim-java/nvim-java](https://github.com/nvim-java/nvim-java)** - java lsp and integrations.
  - **[simrat39/rust-tools.nvim](https://github.com/simrat39/rust-tools.nvim)** - rust lsp and integrations.
  - **[zbirenbaum/copilot.lua](https://github.com/zbirenbaum/copilot.lua)** - copilot companion.

- ui

  - **[folke/noice.nvim](https://github.com/folke/noice.nvim)** - notifications overhaul and cmdline.
  - **[echasnovski/mini.nvim](https://github.com/echasnovski/mini.nvim])** - shows and animates indent lines.
  - **[gen740/SmoothCursor.nvim](https://github.com/gen740/SmoothCursor.nvim)** - scrollbar cursor highlighter and animations.
  - **[todo-comments.nvim](https://github.com/folke/todo-comments.nvim)** - todo comments highlighter

- fm

  - **[stevearc/oil.nvim](https://github.com/stevearc/oil.nvim)** - main file manager with buffer behavior.
  - **[otavioschwanck/arrow.nvim](https://github.com/otavioschwanck/arrow.nvim)** - bookmarks and harpoon!

- utils
  - **[ggandor/leap.nvim](https://github.com/ggandor/leap.nvim)** - lightspeed motions.
  - **[saecki/crates.nvim](https://github.com/saecki/crates.nvim)** - rust crates companion and version manager.

</details>

---

## 🐌 .zshrc

### ✒️ Aliases

some simple aliases for sys, nvim, lsp/linter tools.

<details>
<summary>sys/apt</summary>

```bash
# sourcing .zshrc on shell
alias src="source ~/.zshrc"
# ls coloring
alias ls="ls --color"
# apt operations
alias update="sudo apt update"
alias upgrade="sudo apt upgrade"
alias install="sudo apt install"
alias remove="sudo apt remove"
alias purge="sudo apt purge"
# open .zshrc quickly
alias zshrc="nvim ~/.zshrc"
#  file manager at cwd / nautilus -> if ubuntu/pop-os
alias fm="nautilus . &>/dev/null & disown"
# new terminal
alias warp="/usr/bin/warp-terminal &>/dev/null & disown"
alias term="/usr/bin/warp-terminal &>/dev/null & disown"
```

 </details>

<details>
<summary>nvim</summary>

```bash
# nvim shortcuts
alias vim="nvim"
alias vi="nvim"
alias nv="nvim"
# in sudo -E mode to load nvim binary
alias svim="sudo -E  /opt/nvim/bin/nvim ."
```

</details>

<details>
<summary>lsp/linter</summary>

```bash
# python always python3
alias py="python3"
alias pip="pip3"
# for kotlinc and jar
alias kotlinc="kotlinc -include-runtime -d"
alias jar="java -jar"
# for android studio
alias android="/opt/google/android-studio/studio-app/bin/studio.sh &>/dev/null & disown"
```

</details>

---

### ⚒️ Plugins

some simple autocompletion + syntax highlighting + suggestions plugins via `zinit`.

##### zinit

[Homepage](https://github.com/zdharma-continuum/zinit)

<details>
<summary>zinit setup</summary>

```bash
# ZINIT plugin manager setup
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
# dl zinit if not installed
if [ ! -d $ZINIT_HOME ]; then
	mkdir -p "$(dirname $ZINIT_HOME)"
	git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi
# load zinit
source "${ZINIT_HOME}/zinit.zsh"
```

</details>

<details>
<summary>zinit plugins</summary>

```bash
# syntax highlighting
zinit light zsh-users/zsh-syntax-highlighting
# auto complete
zinit light zsh-users/zsh-completions
# auto suggestions
zinit light zsh-users/zsh-autosuggestions
# autoload completions
autoload -U compinit && compinit
```

</details>

---

##### Starship prompt

setup here but needs installation via [starship.rs](https://starship.rs/).
the custom scheme (starship.toml) is also included in the repo.

<details>
<summary>starship setup</summary>

```bash
# starship prompt
export STARSHIP_SHELL=~/.config/starship.toml
eval "$(starship init zsh)"
```

</details>

---

### 📚 History

for optimal use with zinit auto suggestions and completions.

<details>
<summary>options</summary>

```bash
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
```

</details>

---

### ⌨️ Keybindings

two simple binds (for history suggestions).

<details>
<summary>keybinds</summary>

```bash
# -v for vim mode
bindkey -v
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward
```

</details>

---

### 💈 zstyle

<details>
<summary>options</summary>

```bash
# zstyle case insensitive
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
# zstyle lists colored
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
```

</details>

---

### 🛣️ Pathfinder

CHANGE PATHS HERE - EVERY SYSTEM IS DIFFERENT.

<details>
<summary>paths</summary>

```bash
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
```

</details>

---

---
