##
## Prompt - Enhanced Starship
##

# =============================================================================
# STARSHIP CONFIGURATION
# =============================================================================
# Enhanced starship with right prompt and multiline indicators

# Generate random session key for starship
export STARSHIP_SESSION_KEY=$(head -c 16 /dev/urandom | base64 | tr -d '/+=' | head -c 16)

# Enable right prompt rendering on last line
export STARSHIP_RIGHT_PROMPT_ON_LAST_LINE=1

# Load starship with enhanced configuration
export STARSHIP_CONFIG=$HOME/dotfiles/starship/starship.toml
zinit ice as'command' from'gh-r' \
  atload'eval $(starship init zsh)' \
  atclone'./starship init zsh > init.zsh; ./starship completions zsh > _starship' \
  atpull'%atclone' src'init.zsh'
zinit light starship/starship

# vim:ft=zsh
