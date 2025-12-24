# =============================================================================
# ATUIN - Enhanced shell history
# =============================================================================
# Install with: brew install atuin
# Provides magical shell history with sync capabilities

if command -v atuin &> /dev/null; then
    # Disable atuin's default keybindings (we'll set custom ones)
    export ATUIN_NOBIND="true"
    
    # Initialize atuin
    eval "$(atuin init zsh)"
    
    # Bind to Ctrl+R for history search (standard binding)
    bindkey '^r' atuin-search
    
    # Optional: Bind up arrow to atuin history search
    # bindkey '^[[A' atuin-up-search
    # bindkey '^[OA' atuin-up-search
fi
