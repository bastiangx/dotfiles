use std log

$env.config = (
  $env.config? | default {} | merge {
    show_banner: false
    edit_mode: 'vi'
  }
)

source /Users/bast/dotfiles/nushell/env.nu
source /Users/bast/dotfiles/nushell/aliases.nu
try { source $"($nu.home-path)/.cargo/env.nu" } catch { }

try { source /Users/bast/dotfiles/nushell/configs/carapace.nu } catch { }
try { source /Users/bast/dotfiles/nushell/configs/fnm.nu } catch { }
try { source /Users/bast/dotfiles/nushell/configs/starship.nu } catch { }

# Detect macOS appearance mode and load that catppuccin theme
let macos_appearance = (try {
  let result = (^osascript -e '"System Events" to tell appearance preferences to get dark mode' | complete)
  if $result.exit_code == 0 and ($result.stdout | str trim) == "true" {
    "Dark"
  } else {
    ""
  }
} catch {
  ""
})

if $macos_appearance == "Dark" {
  try { source /Users/bast/dotfiles/nushell/configs/cat-mocha.nu } catch { }
} else {
  try { source /Users/bast/dotfiles/nushell/configs/silk-light.nu } catch { }
}

# Zoxide
use /Users/bast/dotfiles/nushell/configs/zoxide.nu *

# Run at startup
try { nerdfetch } catch { }
