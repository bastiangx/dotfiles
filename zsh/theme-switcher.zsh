# =============================================================================
# DYNAMIC THEME SWITCHING (macOS appearance detection)
# =============================================================================
# Automatically switches between dark and light themes based on macOS appearance

# Detect macOS dark mode
_detect_macos_appearance() {
    if [[ "$OSTYPE" == "darwin"* ]]; then
        local appearance=$(osascript -e 'tell application "System Events" to tell appearance preferences to get dark mode' 2>/dev/null)
        if [[ "$appearance" == "true" ]]; then
            echo "dark"
        else
            echo "light"
        fi
    else
        echo "dark"  # Default to dark on non-macOS
    fi
}

# Apply theme based on appearance
_apply_theme() {
    local mode=$(_detect_macos_appearance)
    
    if [[ "$mode" == "dark" ]]; then
        # Dark mode - Catppuccin Mocha
        export BAT_THEME="Catppuccin Mocha"
        export LS_COLORS="ow=30;44:st=30;44:di=38;5;61:ln=38;5;211:ex=38;5;61"
        export LSCOLORS="fxexexexcxexexdxgxgxbxcxcx"
    else
        # Light mode - Catppuccin Latte or similar
        export BAT_THEME="Catppuccin Latte"
        export LS_COLORS="ow=30;44:st=30;44:di=38;5;61:ln=38;5;211:ex=38;5;61"
        export LSCOLORS="exfxcxdxbxegedabagacad"
    fi
}

# Apply theme on shell start
_apply_theme
