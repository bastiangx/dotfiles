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
        
        # Zsh colors - Dark
        background='#1E1E2E'
        foreground='#CDD6F4'
        color0='#45475A'
        color8='#585B70'
        color1='#F38BA8'
        color9='#F38BA8'
        color2='#A6E3A1'
        color10='#A6E3A1'
        color3='#F9E2AF'
        color11='#F9E2AF'
        color4='#89B4FA'
        color12='#89B4FA'
        color5='#F5C2E7'
        color13='#F5C2E7'
        color6='#94E2D5'
        color14='#94E2D5'
        color7='#BAC2DE'
        color15='#A6ADC8'
    else
        # Light mode - Catppuccin Latte
        export BAT_THEME="Catppuccin Latte"
        export LS_COLORS="ow=30;44:st=30;44:di=38;5;61:ln=38;5;211:ex=38;5;61"
        export LSCOLORS="exfxcxdxbxegedabagacad"
        
        # Zsh colors - Light
        background='#EFF1F5'
        foreground='#4C4F69'
        color0='#BCC0CC'
        color8='#ACB0BE'
        color1='#D20F39'
        color9='#D20F39'
        color2='#40A02B'
        color10='#40A02B'
        color3='#DF8E1D'
        color11='#DF8E1D'
        color4='#1E66F5'
        color12='#1E66F5'
        color5='#EA76CB'
        color13='#EA76CB'
        color6='#179299'
        color14='#179299'
        color7='#5C5F77'
        color15='#6C6F85'
    fi
}

# Apply theme on shell start
_apply_theme
