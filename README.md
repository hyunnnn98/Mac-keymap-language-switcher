# Mac Keymap Language Switcher

> Fast language switching tool for macOS multilingual users (KR/JP ↔ EN)

![demo](https://user-images.githubusercontent.com/52916934/148198606-19ae7e10-0d13-4cc2-b127-ead5771a10a2.gif)

## Features
- 🇰🇷 Korean ↔ 🇺🇸 English: `Caps Lock`
- 🇯🇵 Japanese ↔ 🇺🇸 English: `Right Command`
- Eliminates input delay when switching languages

## Tech Stack
Lua · Hammerspoon

## Why Hammerspoon?
[Hammerspoon](https://www.hammerspoon.org/) is a powerful macOS automation tool that bridges Lua scripting with system APIs. It allows low-level keyboard event handling without native app development.

## Installation

### 1. Install Hammerspoon
```bash
# Homebrew
brew install hammerspoon --cask

# Or download manually from https://www.hammerspoon.org/
```

### 2. Clone this repository
```bash
git clone https://github.com/hyunnnn98/Mac-keymap-language-switcher.git
```

### 3. Setup
1. Open Hammerspoon → Click "Open Config"
2. Copy contents of `init.lua` into the config
3. Click "Reload Config"

## Contributing
Issues and PRs are welcome.
