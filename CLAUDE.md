# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a Hammerspoon configuration repository. Hammerspoon is a macOS automation tool that allows scripting of system behavior using Lua. The configuration is modular, with each feature implemented in separate `.lua` files.

## Architecture and Structure

The codebase follows a modular pattern:
- **Entry point**: `init.lua` - defines the HYPER key, loads SpoonInstall, and requires all modules
- **HYPER key**: Central to all hotkeys. Can be switched between two configurations:
  - Configuration 1: `Cmd+Alt+Ctrl+Shift`
  - Configuration 2: `RCmd+RAlt`
  - Switch with HYPER+0
- **Modules**: Each `.lua` file provides specific functionality (window management, app switching, etc.)
- **Spoons**: Third-party extensions stored in `Spoons/` directory (gitignored)
- **Configuration storage**: HYPER preference saved in `~/.config/hammerspoon/hyper_idx`

## Key Modules and Their Responsibilities

- `app-switcher.lua`: Quick app launching via HYPER+letter combinations using AppLauncher Spoon
- `window-mgmt.lua`: Window positioning and sizing using WinWin and WindowHalfsAndThirds Spoons
- `chrome.lua`: Chrome-specific utilities (menubar item, URL copying)
- `super-keys.lua`: Advanced screenshot and screen recording functionality
- `clipboard.lua`: Enhanced clipboard operations (paste by typing)
- `web-mode.lua`: Modal web commands (HYPER+Q to enter)
- `alacritty.lua`: Terminal-specific tmux integration
- `bluetooth.lua`: (Disabled) Auto-switches HYPER based on connected keyboard
- `hsutils.lua`: Utility functions for file operations, MOV→WebM conversion, and debugging

## Development Guidelines

### Adding New Functionality
1. Create a new `.lua` file for the feature
2. Add `require('filename')` at the bottom of `init.lua`
3. Use the HYPER key for primary hotkeys to maintain consistency
4. Use `hs.alert.show()` for user feedback
5. Use `hs.logger` for debugging (see existing modules for examples)

### Testing Changes
- Reload configuration with HYPER+R
- Check Hammerspoon console for errors
- Test hotkeys immediately after reload

### Common Patterns
```lua
-- Standard module structure
local M = {}

-- Logger setup
local logger = hs.logger.new("module-name", "info")

-- Hotkey binding
hs.hotkey.bind(HYPER, "key", function()
    -- functionality
    hs.alert.show("Action performed")
end)

return M
```

## Important Notes

- This is a runtime-interpreted Lua environment; there are no build/test commands
- The global `HYPER` variable is defined in `init.lua` and available to all modules
- Spoons are managed via SpoonInstall and stored in the gitignored `Spoons/` directory
- When modifying keybindings, ensure they don't conflict with existing ones
- The configuration supports dual HYPER key setups for different keyboard types