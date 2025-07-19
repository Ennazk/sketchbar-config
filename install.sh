#!/bin/bash

# Sketchybar Modern Configuration Installation Script
# This script automates the setup process for the Sketchybar configuration

set -e  # Exit on any error

echo "🚀 Installing Modern Sketchybar Configuration..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Helper functions
print_step() {
    echo -e "${BLUE}📋 $1${NC}"
}

print_success() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

# Check if running on macOS
if [[ "$OSTYPE" != "darwin"* ]]; then
    print_error "This configuration is designed for macOS only."
    exit 1
fi

# Check if Homebrew is installed
if ! command -v brew &> /dev/null; then
    print_step "Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    print_success "Homebrew installed"
else
    print_success "Homebrew already installed"
fi

# Install Sketchybar
print_step "Installing Sketchybar..."
if ! command -v sketchybar &> /dev/null; then
    brew install sketchybar
    print_success "Sketchybar installed"
else
    print_success "Sketchybar already installed"
fi

# Install Aerospace
print_step "Installing Aerospace..."
if ! command -v aerospace &> /dev/null; then
    brew install --cask nikitabobko/tap/aerospace
    print_success "Aerospace installed"
else
    print_success "Aerospace already installed"
fi

# Install jq
print_step "Installing jq..."
if ! command -v jq &> /dev/null; then
    brew install jq
    print_success "jq installed"
else
    print_success "jq already installed"
fi

# Install SF Pro font via Homebrew
print_step "Installing SF Pro font..."
if ! brew list --cask font-sf-pro &> /dev/null; then
    brew tap homebrew/cask-fonts
    brew install --cask font-sf-pro
    print_success "SF Pro font installed"
else
    print_success "SF Pro font already installed"
fi

# Install SF Symbols app via Homebrew
print_step "Installing SF Symbols app..."
if ! brew list --cask sf-symbols &> /dev/null; then
    brew install --cask sf-symbols
    print_success "SF Symbols app installed"
else
    print_success "SF Symbols app already installed"
fi

# Install sketchybar-app-font
print_step "Installing Sketchybar App Font..."
FONT_PATH="$HOME/Library/Fonts/sketchybar-app-font.ttf"
if [[ ! -f "$FONT_PATH" ]]; then
    curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.16/sketchybar-app-font.ttf -o "$FONT_PATH"
    print_success "Sketchybar App Font installed"
else
    print_success "Sketchybar App Font already installed"
fi

# Clear font cache to ensure fonts are loaded
print_step "Refreshing font cache..."
sudo atsutil databases -remove
print_success "Font cache refreshed"

# Backup existing configuration
if [[ -d "$HOME/.config/sketchybar" ]]; then
    print_step "Backing up existing Sketchybar configuration..."
    mv "$HOME/.config/sketchybar" "$HOME/.config/sketchybar.backup.$(date +%Y%m%d_%H%M%S)"
    print_success "Existing configuration backed up"
fi

# Create configuration directory
print_step "Creating Sketchybar configuration directory..."
mkdir -p "$HOME/.config/sketchybar"

# Copy configuration files (assuming this script is run from the config directory)
print_step "Copying configuration files..."
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Copy all files except this install script and git files
rsync -av --exclude='install.sh' --exclude='.git*' --exclude='README.md' "$SCRIPT_DIR/" "$HOME/.config/sketchybar/"

print_success "Configuration files copied"

# Make scripts executable
print_step "Making scripts executable..."
chmod +x "$HOME/.config/sketchybar/sketchybarrc"
chmod +x "$HOME/.config/sketchybar/plugins/"*.sh
chmod +x "$HOME/.config/sketchybar/items/"*.sh
print_success "Scripts made executable"

# Start Sketchybar service
print_step "Starting Sketchybar service..."
brew services restart sketchybar
print_success "Sketchybar service started"

# Setup Aerospace configuration
print_step "Setting up Aerospace configuration..."
AEROSPACE_CONFIG="$HOME/.aerospace.toml"
if [[ ! -f "$AEROSPACE_CONFIG" ]]; then
    if [[ -f "$SCRIPT_DIR/aerospace.toml" ]]; then
        cp "$SCRIPT_DIR/aerospace.toml" "$AEROSPACE_CONFIG"
        print_success "Aerospace configuration installed"
    else
        print_warning "aerospace.toml not found in repository. You'll need to configure Aerospace manually."
    fi
else
    print_warning "Aerospace configuration already exists. Backup at $AEROSPACE_CONFIG.backup"
    cp "$AEROSPACE_CONFIG" "$AEROSPACE_CONFIG.backup.$(date +%Y%m%d_%H%M%S)"
    if [[ -f "$SCRIPT_DIR/aerospace.toml" ]]; then
        cp "$SCRIPT_DIR/aerospace.toml" "$AEROSPACE_CONFIG"
        print_success "Aerospace configuration updated"
    fi
fi

# Restart Aerospace to load new configuration
if pgrep -x "AeroSpace" > /dev/null; then
    print_step "Restarting Aerospace to load new configuration..."
    killall AeroSpace 2>/dev/null || true
    sleep 1
    open -a AeroSpace
    print_success "Aerospace restarted"
fi

# Final checks
print_step "Running final checks..."
sleep 2

if pgrep -x "sketchybar" > /dev/null; then
    print_success "Sketchybar is running successfully!"
else
    print_warning "Sketchybar may not be running. Try: brew services restart sketchybar"
fi

echo ""
echo -e "${GREEN}🎉 Installation completed successfully!${NC}"
echo ""
echo -e "${BLUE}Next steps:${NC}"
echo "1. Log out and log back in (or restart) for fonts to fully load"
echo "2. Launch Aerospace if it's not already running"
echo "3. Use Alt+1, Alt+2, etc. to switch between workspaces"
echo "4. Customize colors in ~/.config/sketchybar/colors.sh if desired"
echo ""
echo -e "${BLUE}Troubleshooting:${NC}"
echo "• If icons don't appear: brew services restart sketchybar"
echo "• If workspaces don't update: ensure Aerospace is running"
echo "• If fonts look wrong: restart your system"
echo "• For more help, see README.md"
echo ""
echo -e "${YELLOW}Enjoy your new modern menu bar! 🎯${NC}"
