use std log

$env.config = (
  $env.config? | default {} | merge {
    show_banner: false
    edit_mode: 'vi'
  }
)

source /Users/bast/dotfiles/nushell/env.nu

$env.PKG_CONFIG_PATH = "/opt/homebrew/lib/pkgconfig"
source /Users/bast/dotfiles/nushell/aliases.nu
try { source /Users/bast/.cargo/env.nu } catch { }

try { source /Users/bast/dotfiles/nushell/configs/carapace.nu } catch { }
try { use /Users/bast/dotfiles/nushell/configs/fnm.nu } catch { }
try { source /Users/bast/dotfiles/nushell/configs/starship.nu } catch { }

  try { source /Users/bast/dotfiles/nushell/configs/cat-mocha.nu } catch { }
  # try { source /Users/bast/dotfiles/nushell/configs/silk-light.nu } catch { }

# Zoxide
use /Users/bast/dotfiles/nushell/configs/zoxide.nu *

# Run at startup
try { nerdfetch-rs } catch { }
