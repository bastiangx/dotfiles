#!/bin/bash

##################
#
# This script will bootstrap my own personal fresh "Manjaro/Arch" based linux systems.
# Starts from most important bits and pieces like `base-devel` and initial updates,
# Then installs `yay` and other packages that I use on daily basis.
#
# - CLI & TUI apps like nvim, spf, btop, fish shell, etc.
# - GUI apps like brave-browser, discord, obsidian, etc.
# - Most of the packages are installed via `yay` git/latest versions but some may use `curl` such as rustup and brave-browser.
#
# - Nvidia/Intel drivers are ignored as I don't use them & they're not compatible with wayland/hyprland.
# - Essential packages for hardware, such as sound, bluetooth, wifi come pre-installed with Manjaro.
#
# - my dotfiles can be found [here](https://github.com/bastiangx/dotfiles) - (hyprland rice mostly based on Matt-ftw3's dotfiles)
#
##################

# term colors for output
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

MAX_RETRIES=3
ALL_FAILED_PACKAGES=()

confirm_installation() {
  echo -e "${YELLOW}⚠️  WARNING: This script is designed for fresh Manjaro installations.${NC}"
  echo -e "${YELLOW}Running it on an existing system may cause conflicts or break packages.${NC}"
  echo -e "\nDo you confirm this is a fresh Manjaro installation? [y/N]: "
  read -r response

  if [[ ! "$response" =~ ^[yY]$ ]]; then
    echo -e "${RED}Installation aborted.${NC}"
    exit 1
  fi

  echo -e "${GREEN}Proceeding with installation...${NC}"
}

check_system_requirements() {
  echo -e "${BLUE}Checking system requirements...${NC}"

  # internet connectivity
  echo -e "  ${BLUE}Checking internet connection...${NC}"
  if ! ping -c 1 archlinux.org &>/dev/null; then
    echo -e "  ${RED}No internet connection. Please check your network settings.${NC}"
    return 1
  fi
  echo -e "  ${GREEN}✓ Internet connection available${NC}"

  # available disk space
  echo -e "  ${BLUE}Checking available disk space...${NC}"
  local free_space
  free_space=$(df -BG / | awk 'NR==2 {print $4}' | sed 's/G//')
  if ((free_space < 10)); then
    echo -e "  ${RED}Not enough disk space. At least 10GB free space required.${NC}"
    echo -e "  ${RED}Current free space: ${free_space}GB${NC}"
    return 1
  fi
  echo -e "  ${GREEN}✓ Sufficient disk space available (${free_space}GB)${NC}"

  return 0
}

# bootstrap script for pacman updating initial packages + yay
init_system() {
  echo -e "\n${BLUE}Initializing system...${NC}"

  # update sys packs
  echo -e "${GREEN}Updating initial packages...${NC}"
  sudo pacman -Syu || {
    echo -e "${RED}Failed to update via pacman -Syu${NC}"
    return 1
  }

  # base-devel
  echo -e "${GREEN}Installing base-devel...${NC}"
  sudo pacman -S --needed base-devel || {
    echo -e "${RED}Failed to install base-devel${NC}"
    return 1
  }

  # fakeroot
  echo -e "${GREEN}Installing fakeroot...${NC}"
  sudo pacman -S --needed fakeroot || {
    echo -e "${RED}Failed to install fakeroot${NC}"
    return 1
  }

  # curl
  echo -e "${GREEN}Installing curl...${NC}"
  sudo pacman -S --needed curl || {
    echo -e "${RED}Failed to install curl${NC}"
    return 1
  }

  # yay
  echo -e "${GREEN}Installing yay...${NC}"
  sudo pacman -S --needed yay || {
    echo -e "${RED}Failed to install yay${NC}"
    return 1
  }

  echo -e "${GREEN}System bootstrap completed${NC}"
  return 0
}

# via yay
install_packages() {
  local packages=("$@")
  local attempt=1
  local category_name="$1"
  shift

  echo -e "\n${BLUE}Installing ${category_name}...${NC}"

  while [ $attempt -le $MAX_RETRIES ]; do
    echo -e "${GREEN}Attempt $attempt: Installing ${category_name} packages${NC}"

    if yay -S --needed "${packages[@]}"; then
      echo -e "${GREEN}All ${category_name} packages installed successfully${NC}"
      return 0
    else
      echo -e "${YELLOW}Some ${category_name} packages failed to install on attempt $attempt${NC}"
      ((attempt++))
      [ $attempt -le $MAX_RETRIES ] && sleep 1
    fi
  done

  # If we get here, some packages failed after all retries
  echo -e "${YELLOW}Failed to install some ${category_name} packages after $MAX_RETRIES attempts${NC}"
  echo -e "${YELLOW}You may need to install them manually later${NC}"
  ALL_FAILED_PACKAGES+=("$category_name")
  return 0
}

# via curl
install_curl() {
  local -A apps=(
    ["brave"]="https://dl.brave.com/install.sh|-fsS"
    ["rustup"]="https://sh.rustup.rs|--proto '=https' --tlsv1.2 -sSf"
    ["catppuccin"]="https://github.com/ljmill/catppuccin-icons/releases/download/v0.2.0/Catppuccin-SE.tar.bz2|-LJO"
    ["bun"]="https://bun.sh/install|-fsSL"
    ["superfile"]="https://superfile.netlify.app/install.sh|-sLo"
  )
  local failed_apps=()

  echo -e "\n${BLUE}Installing apps via curl...${NC}"

  for app in "${!apps[@]}"; do
    local url="${apps[$app]%%|*}"
    local flags="${apps[$app]#*|}"
    local attempt=1
    local success=false
    local already_installed=false

    # check if curl apps are already installed
    case "$app" in
    brave)
      if command -v brave-browser &>/dev/null || pacman -Q brave-browser &>/dev/null; then
        echo -e "${GREEN}✓ brave-browser is already installed, skipping...${NC}"
        already_installed=true
      fi
      ;;
    rustup)
      if command -v rustup &>/dev/null || command -v cargo &>/dev/null; then
        echo -e "${GREEN}✓ rustup/rust is already installed, skipping...${NC}"
        already_installed=true
      fi
      ;;
    catppuccin)
      if [ -d "$HOME/.local/share/icons/Catppuccin-SE" ] || [ -d "/usr/share/icons/Catppuccin-SE" ]; then
        echo -e "${GREEN}✓ catppuccin icons are already installed, skipping...${NC}"
        already_installed=true
      fi
      ;;
    esac

    if [ "$already_installed" = true ]; then
      continue
    fi

    while [ $attempt -le $MAX_RETRIES ] && [ "$success" = false ]; do
      echo -e "${GREEN}Attempt $attempt: Installing $app...${NC}"

      if [[ "$flags" == "-LJO" ]]; then
        if curl ${flags:+"${flags}"} "$url"; then
          success=true
        else
          echo -e "${YELLOW}Failed to download $app (attempt $attempt)${NC}"
        fi
      else
        if curl ${flags:+"${flags}"} "$url" | bash; then
          success=true
        else
          echo -e "${YELLOW}Failed to install $app (attempt $attempt)${NC}"
        fi
      fi

      if [ "$success" = false ]; then
        ((attempt++))
        [ $attempt -le $MAX_RETRIES ] && sleep 1
      fi
    done

    if [ "$success" = false ]; then
      failed_apps+=("$app")
    else
      echo -e "${GREEN}✓ $app installed successfully${NC}"
    fi
  done

  if [ ${#failed_apps[@]} -eq 0 ]; then
    echo -e "${GREEN}All curl applications installed successfully${NC}"
    return 0
  else
    echo -e "${YELLOW}Failed to install the following apps: ${failed_apps[*]}${NC}"
    ALL_FAILED_PACKAGES+=("curl apps: ${failed_apps[*]}")
    return 0
  fi
}

# clone my own dotfiles
clone_dotfiles() {
  local attempt=1
  local repo_url="https://github.com/bastiangx/dotfiles.git"
  local target_dir="$HOME/dotfiles"

  echo -e "\n${BLUE}Cloning dotfiles repository...${NC}"

  while [ $attempt -le $MAX_RETRIES ]; do
    echo -e "${GREEN}Attempt $attempt: Cloning dotfiles repository...${NC}"

    # Check if directory already exists
    if [ -d "$target_dir" ]; then
      echo -e "${YELLOW}Dotfiles directory already exists at $target_dir${NC}"
      echo -e "${YELLOW}Skipping clone and continuing with installation...${NC}"
      return 0
    fi

    if cd "$HOME"; then
      if ! git clone "$repo_url"; then
        echo -e "${RED}Failed to clone dotfiles on attempt $attempt${NC}"
        ((attempt++))
        sleep 1
        continue
      fi
    else
      echo -e "${RED}Failed to change directory on attempt $attempt${NC}"
      ((attempt++))
      sleep 1
      continue
    fi

    echo -e "${GREEN}Successfully cloned dotfiles to $target_dir${NC}"
    return 0
  done

  echo -e "${YELLOW}Failed to clone dotfiles after $MAX_RETRIES attempts${NC}"
  echo -e "${YELLOW}You may want to clone them manually later${NC}"
  ALL_FAILED_PACKAGES+=("dotfiles repository")
  return 0
}

setup_package_groups() {
  core_tools=(
    "git" "meson" "fish" "fisher" "go" "zig-nightly-bin" "unzip"
    "ripgrep-git" "fzf" "npm" "yadm" "jq" "starship"
    "eza" "fd" "vivid" "bat" "yazi" "nerdfetch"
    "cpio" "pkg-config"
  )

  dev_tools=(
    "neovim-nightly-bin" "github-cli" "code" "blueprint-compiler"
    "zoxide" "lazygit" "git-delta"
  )

  wayland_desktop=(
    "hyprland" "hyprlock" "hypridle" "xdg-desktop-portal-hyprland"
    "hyprpicker" "swww" "waybar" "waybar-updates" "rofi-wayland"
    "swaync" "wl-clipboard" "cliphist" "xclip" "swayosd-git"
    "brightnessctl" "polkit-gnome" "playerctl" "pyprland"
    "grim" "slurp" "satty"
  )

  gui_apps=(
    "obsidian" "btop" "nemo" "thunar" "zathura" "zathura-pdf-mupdf"
    "qimgv-light" "mpv" "discord-canary" "pavucontrol"
    "visual-studio-code-bin" "ghostty"
  )

  system_utils=(
    "udiskie" "devify" "wluma" "input-remapper-git" "bluez"
    "overskride" "iwgtk" "auto-cpufreq" "libdbusmenu-glib"
  )

  fonts=(
    "font-manager"
    "ttf-jetbrains-mono-nerd" "ttf-nerd-fonts-symbols"
    "ttf-nerd-fonts-symbols-mono" "ttf-nerd-fonts-symbols-common"
    "ttf-0xproto-nerd" "ttf-3270-nerd" "ttf-sourcecodepro-nerd"
    "ttf-agave-nerd" "ttf-anonymouspro-nerd" "ttf-cascadia-code-nerd"
    "ttf-firacode-nerd" "ttf-hack-nerd" "ttf-ibmplex-nerd"
    "ttf-font-awesome" "noto-fonts-cjk"
  )
}

print_summary() {
  echo -e "\n${BLUE}===============================================${NC}"
  echo -e "${BLUE}===============================================${NC}"

  if [ ${#ALL_FAILED_PACKAGES[@]} -eq 0 ]; then
    echo -e "${GREEN}All packs installed successfully!${NC}"
  else
    echo -e "${YELLOW}The following failed in installation:${NC}"
    for failed in "${ALL_FAILED_PACKAGES[@]}"; do
      echo -e "${YELLOW}- $failed${NC}"
    done
    echo -e "${YELLOW}You may need to install them manually.${NC}"
  fi

  echo -e "\n${GREEN}System bootstrap completed!${NC}"
  echo -e "${GREEN}You may want to reboot or logout from your system to apply all changes.${NC}"
}

main() {
  confirm_installation

  check_system_requirements || {
    echo -e "${RED}System requirements check failed${NC}"
    exit 1
  }

  init_system || {
    echo -e "${RED}System initialization failed${NC}"
    exit 1
  }

  clone_dotfiles

  setup_package_groups

  install_packages "${core_tools[@]}"
  install_packages "${dev_tools[@]}"
  install_packages "${wayland_desktop[@]}"
  install_packages "${gui_apps[@]}"
  install_packages "${system_utils[@]}"
  install_packages "${fonts[@]}"

  install_curl

  print_summary

  # chsh to fish
  echo -e "\n${BLUE}Changing shell to fish...${NC}"
  echo -e "\n${BLUE}Remember to use Fisher after loggint out to install your plugins.${NC}"
  sleep 1
  chsh -s "$(command -v fish)" || {
    echo -e "${RED}Failed to change shell to fish${NC}"
    exit 1
  }
}

main
