use std log

$env.config = (
  $env.config? | default {} | merge {
    show_banner: false
  }
)

source /Users/bast/dotfiles/nushell/env.nu
source /Users/bast/dotfiles/nushell/aliases.nu
try { source $"($nu.home-path)/.cargo/env.nu" } catch { }

try { source /Users/bast/dotfiles/nushell/configs/carapace.nu } catch { }
try { source /Users/bast/dotfiles/nushell/configs/atuin.nu } catch { }
try { source /Users/bast/dotfiles/nushell/configs/fnm.nu } catch { }
try { source /Users/bast/dotfiles/nushell/configs/starship.nu } catch { }
try { source /Users/bast/dotfiles/nushell/configs/catppuccin.nu } catch { }

# Zoxide
use /Users/bast/dotfiles/nushell/configs/zoxide.nu *

# Run at startup
try { nerdfetch } catch { }
