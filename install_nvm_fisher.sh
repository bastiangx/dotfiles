#!/bin/bash

# Colors for output formatting
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
RED='\033[0;31m'
BLUE='\033[0;34m'
NC='\033[0m'

# Constants
MAX_RETRIES=3

check_fish_shell() {
  echo -e "${BLUE}Checking if fish is the current shell...${NC}"

  if [ "$(basename "$SHELL")" != "fish" ]; then
    echo -e "${RED}Fish is not set as the current shell.${NC}"
    echo -e "${YELLOW}Please run 'chsh -s $(which fish)' first and then restart this script.${NC}"
    return 1
  fi

  echo -e "${GREEN}✓ Fish is your current shell${NC}"
  return 0
}

check_fisher_installed() {
  echo -e "${BLUE}Checking if Fisher is installed...${NC}"

  if ! fish -c "type -q fisher" &>/dev/null; then
    echo -e "${RED}Fisher is not installed.${NC}"
    echo -e "${YELLOW}Please install Fisher first:${NC}"
    echo -e "${YELLOW}curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher${NC}"
    return 1
  fi

  echo -e "${GREEN}✓ Fisher is installed${NC}"
  return 0
}

install_nvm_plugin() {
  echo -e "${BLUE}Installing nvm.fish plugin...${NC}"
  local attempt=1

  while [ $attempt -le $MAX_RETRIES ]; do
    echo -e "${GREEN}Attempt $attempt: Installing nvm.fish plugin${NC}"

    if fish -c "fisher install jorgebucaran/nvm.fish" &>/dev/null; then
      echo -e "${GREEN}✓ Successfully installed nvm.fish plugin${NC}"
      return 0
    else
      echo -e "${YELLOW}Failed to install nvm.fish plugin (attempt $attempt)${NC}"
      ((attempt++))
      [ $attempt -le $MAX_RETRIES ] && sleep 1
    fi
  done

  echo -e "${RED}Failed to install nvm.fish plugin after $MAX_RETRIES attempts${NC}"
  return 1
}

setup_node() {
  echo -e "${BLUE}Setting up Node using nvm...${NC}"

  echo -e "${GREEN}Reloading fish configuration...${NC}"
  # reload src
  fish -c "source ~/.config/fish/config.fish" &>/dev/null

  echo -e "${GREEN}Installing latest Node version...${NC}"
  local attempt=1

  while [ $attempt -le $MAX_RETRIES ]; do
    echo -e "${GREEN}Attempt $attempt: Installing latest${NC}"

    if fish -c "nvm install latest" &>/dev/null; then
      echo -e "${GREEN}✓ Successfully installed latest Node${NC}"
      break
    else
      echo -e "${YELLOW}Failed to install latest Node(attempt $attempt)${NC}"
      ((attempt++))
      [ $attempt -le $MAX_RETRIES ] && sleep 1
    fi

    if [ $attempt -gt $MAX_RETRIES ]; then
      echo -e "${RED}Failed to install Node after $MAX_RETRIES attempts${NC}"
      return 1
    fi
  done

  if fish -c "nvm use latest" &>/dev/null; then
    echo -e "${GREEN}✓ Now using latest Node version${NC}"

    node_version=$(fish -c "node --version")
    echo -e "${GREEN}✓ Node version: $node_version${NC}"
    return 0
  else
    echo -e "${RED}Failed to use latest Node version${NC}"
    return 1
  fi
}

main() {
  echo -e "${BLUE}===============================================${NC}"
  echo -e "${BLUE}       Setting up fish shell with nvm          ${NC}"
  echo -e "${BLUE}===============================================${NC}"

  check_fish_shell || {
    echo -e "${RED}error: Fish check failed. Please install and set fish as your default shell first.${NC}"
    exit 1
  }

  check_fisher_installed || {
    echo -e "${RED}error: Fisher is not installed. Please install Fisher first.${NC}"
    exit 1
  }

  install_nvm_plugin || {
    echo -e "${RED}error: Failed to install nvm.fish plugin. Exiting.${NC}"
    exit 1
  }

  setup_node || {
    echo -e "${RED}Node setup failed. You may need to set it up manually.${NC}"
    exit 1
  }

  echo -e "\n${GREEN}===============================================${NC}"
  echo -e "${GREEN}      ✓ Fish is now using latest node            ${NC}"
  echo -e "${GREEN}=================================================${NC}"
}

main

