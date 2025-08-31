<div align="center">
<h1> Developer Dotfiles</h1>

Personal collection of ricing, tools and _dev_ flow!

<img src="https://files.catbox.moe/lhzu55.png" alt="Terminal Screenshot" width="750"/>
</div>

---

### 💻 Editors

#### ❄️ Cursor & VSCode

<div align="center">
<img src="https://files.catbox.moe/fmr775.png" alt="Terminal Screenshot" width="750"/>
</div>
<br></br>


- Simple `settings.json` config files to [get you started](https://docs.cursor.com/en/get-started/quickstart)
  - [cursor plugins list](../cursor/extensions.json)
  - [cursor config](../cursor/settings.json)
  + [vscode plugins list](../vscode/extensions.json)
  + [vscode config](../vscode/settings.json)

#### ⚡ Neovim

<div align="center">
<img src="https://files.catbox.moe/6srctt.png" alt="Terminal Screenshot" width="750"/>
</div>
<br></br>

- [Neovim](https://neovim.org) - vim-fork written in [Lua](https://lua.org/about.html)
  - [config files](../nvim/lua/)
  - [Original LazyVim config](https://lazyvim.org/)

### 👻 Terminal

<div align="center">
<img src="https://files.catbox.moe/y62h4b.png" alt="Terminal Screenshot" width="750"/>
</div>
<br></br>

- [Ghostty](https://ghostty.org) - gpu accelerated native terminal written in [Zig](https://ziglang.org), by [Hashimoto](https://x.com/mitchellh)
  - [config files](../ghostty/config)
  - [ghostty themes](../ghostty/themes)

#### 🐚 Nushell

- [Nushell](https://www.nushell.sh) - awesome data-first shell, written in [Rust](https://rust-lang.org)
  - [config folder](../nushell/)


## Installation

Simply copy the relevant files to your config directory, or use a symlink

> [!TIP]
> Config folder is usually `~/.config/` and then the name of the app

Symlink the folders from this directory to your config directory

```sh
git clone https://github.com/bastiangx/dotfiles.git

## nvim for example
ln -s ~/path/to/dotfiles/nvim ~/.config/nvim
nvim
```
- Backup any existing files before linking. ( use `mv folderName folderName.bak` )
- Make sure you have installed the tools and apps in your system.
