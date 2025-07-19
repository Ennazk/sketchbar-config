# Modern Sketchybar Configuration

A clean, modern macOS menu bar replacement using Sketchybar with Aerospace window manager integration.

![Preview](preview.png)

## Features

- **Transparent modern design** with white icons and text
- **Aerospace workspace indicators** (1 2 [3] 4 5 format with highlighting)
- **Current app display** with app-specific icons
- **System monitoring** (calendar, volume, battery, CPU usage)
- **Media controls** with now playing information
- **Extensive app icon support** (400+ applications)

## Quick Installation

### One-Command Setup (Recommended)
```bash
git clone git@github.com:Ennazk/sketchbar-config.git ~/.config/sketchybar
cd ~/.config/sketchybar
./install.sh
```

The install script will automatically:
- Install Homebrew (if needed)
- Install Sketchybar and Aerospace
- Install all required fonts (SF Pro, SF Symbols, sketchybar-app-font)
- Install jq for JSON processing
- Copy and configure Aerospace settings
- Set up and start all services

### Manual Installation

If you prefer to install manually, follow the dependencies section below.

## Dependencies

The installation script handles all of these automatically, but for manual installation:

### 1. Install Homebrew (if not already installed)
```bash
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### 2. Install Core Applications
```bash
# Sketchybar
brew install sketchybar

# Aerospace window manager
brew install --cask nikitabobko/tap/aerospace

# JSON processor
brew install jq
```

### 3. Install Fonts
```bash
# Add font tap and install SF Pro
brew tap homebrew/cask-fonts
brew install --cask font-sf-pro

# Install SF Symbols app
brew install --cask sf-symbols

# Install Sketchybar App Font
curl -L https://github.com/kvndrsslr/sketchybar-app-font/releases/download/v1.0.16/sketchybar-app-font.ttf -o ~/Library/Fonts/sketchybar-app-font.ttf

# Refresh font cache
sudo atsutil databases -remove
```

## Configuration Structure

```
~/.config/sketchybar/
├── sketchybarrc           # Main configuration file
├── colors.sh              # Color scheme definitions
├── items/                 # Item definitions
│   ├── workspaces.sh      # Aerospace workspace indicators
│   ├── front_app.sh       # Current application display
│   ├── calendar.sh        # Date and time
│   ├── volume.sh          # Volume control
│   ├── battery.sh         # Battery status
│   ├── cpu.sh             # CPU usage
│   └── media.sh           # Media player controls
└── plugins/               # Plugin scripts
    ├── workspace.sh       # Workspace highlighting logic
    ├── front_app.sh       # App icon and name handling
    ├── calendar.sh        # Date/time formatting
    ├── volume.sh          # Volume monitoring
    ├── battery.sh         # Battery monitoring
    ├── cpu.sh             # CPU monitoring
    ├── media.sh           # Media player integration
    └── icon_map_fn.sh     # App icon mappings (400+ apps)
```

## Customization

### Changing Colors
Edit `colors.sh` to modify the color scheme:

```bash
# For a dark theme
export BAR_COLOR=0xff101314
export ITEM_BG_COLOR=0xff353c3f
export ACCENT_COLOR=0xffffffff

# For a purple theme
export BAR_COLOR=0xff140c42
export ITEM_BG_COLOR=0xff2b1c84
export ACCENT_COLOR=0xffeb46f9
```

### Adding New App Icons
Add new app mappings to `plugins/icon_map_fn.sh`:

```bash
"Your App Name")
  icon_result=":your_icon_name:"
  ;;
```

### Adjusting Bar Position
Modify the bar position in `sketchybarrc`:

```bash
sketchybar --bar y_offset=2  # Distance from top of screen
```

### Customizing Item Spacing
Adjust padding in the defaults section of `sketchybarrc`:

```bash
sketchybar --default padding_left=3 \
                     padding_right=3 \
                     label.padding_left=4 \
                     label.padding_right=8
```

## Aerospace Configuration

The installation includes a complete Aerospace configuration with:

### Workspace Management
- **Alt + 1-5**: Switch to workspace 1-5
- **Alt + Shift + 1-5**: Move focused window to workspace 1-5

### Window Navigation
- **Alt + H/J/K/L**: Focus window left/down/up/right
- **Alt + Shift + H/J/K/L**: Move window left/down/up/right

### Window Management
- **Alt + F**: Toggle fullscreen
- **Alt + Shift + Space**: Toggle floating/tiling
- **Alt + Shift + C**: Close window
- **Alt + /**: Switch between tile layouts
- **Alt + ,**: Switch to accordion layout

### Monitor Management
- **Alt + Tab**: Focus next monitor
- **Alt + Shift + Tab**: Focus previous monitor

### System
- **Alt + Shift + R**: Reload Aerospace configuration

The configuration automatically makes certain apps (Finder, System Preferences, Calculator) float by default.

## Troubleshooting

### Workspace indicators not updating
1. Ensure Aerospace is running: `aerospace --version`
2. Check if the workspace change event is registered: `sketchybar --query bar`
3. Manually trigger workspace highlighting: `~/.config/sketchybar/plugins/update_workspaces.sh`

### App icons not showing
1. Verify sketchybar-app-font is installed: `ls ~/Library/Fonts/sketchybar-app-font.ttf`
2. Check if your app is mapped in `plugins/icon_map_fn.sh`
3. Restart Sketchybar: `brew services restart sketchybar`

### Bar not appearing
1. Make sure Sketchybar service is running: `brew services list | grep sketchybar`
2. Check for errors: `sketchybar --reload`
3. Verify configuration syntax: `bash -n ~/.config/sketchybar/sketchybarrc`

### Fonts not displaying correctly
1. Ensure SF Pro is installed system-wide
2. Clear font cache: `sudo atsutil databases -remove`
3. Restart your system

## Usage

### Workspace Navigation
- Use Aerospace keybindings to switch workspaces (e.g., `Alt+1`, `Alt+2`, etc.)
- Active workspace will be highlighted in white
- Inactive workspaces appear in gray

### Volume Control
- Click volume icon to toggle mute
- Scroll over volume icon to adjust volume

### Battery Status
- Shows battery percentage and icon
- Icon changes based on charging state and battery level

### Media Controls
- Displays currently playing media information
- Shows only when media is actively playing

## Advanced Configuration

### Adding Custom Items
Create a new item file in `items/` directory:

```bash
#!/bin/bash
sketchybar --add item my_custom_item right \
           --set my_custom_item icon="💡" \
                                label="Custom" \
                                script="$PLUGIN_DIR/my_custom_plugin.sh" \
                                update_freq=10
```

### Creating Custom Plugins
Create a corresponding plugin in `plugins/` directory:

```bash
#!/bin/bash
# Custom plugin logic here
sketchybar --set $NAME label="Updated at $(date +%H:%M)"
```

## Contributing

1. Fork the repository
2. Create a feature branch: `git checkout -b feature-name`
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## Credits

- [Sketchybar](https://github.com/FelixKratz/SketchyBar) by FelixKratz
- [Aerospace](https://github.com/nikitabobko/AeroSpace) by nikitabobko
- [Sketchybar App Font](https://github.com/kvndrsslr/sketchybar-app-font) by kvndrsslr
- Icon mappings inspired by various community configurations

## License

MIT License - see LICENSE file for details.
