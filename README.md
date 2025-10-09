# Dotfiles

My personal dotfiles repository for managing configuration files across different systems and applications.

## Overview

This repository houses all my dotfiles, managed using **GNU Stow** for easy symlinking and organization. The setup is designed to be modular, allowing selective installation of configurations based on the system and requirements.

## System Details

- **Primary OS**: Ubuntu 24.04.3 LTS
- **Repository Location**: `/mnt/storage/Code/Personal/dotfiles`
- **Stow Target**: `$HOME` directory
- **Version Control**: Git

## Structure

Each directory represents a separate "stow package" containing configuration files for a specific application or tool:

```
dotfiles/
├── alacritty/          # Alacritty terminal emulator config
├── aliases/            # Shell aliases
├── bashrc/             # Bash shell configuration
├── fastfetch/          # Fastfetch system info tool config
├── fzf/                # Fuzzy finder configuration
├── nautilus/           # Nautilus file manager scripts and config
├── powershell/         # PowerShell profile
├── starship/           # Starship prompt configuration
├── tmux/               # Tmux terminal multiplexer config
└── zsh/                # Zsh shell configuration
```

## Installation

### Prerequisites

- **GNU Stow**: Install via package manager
  ```bash
  sudo apt install stow
  ```

### Usage

1. **Clone the repository** (if not already present):
   ```bash
   git clone <repository-url> /mnt/storage/Code/Personal/dotfiles
   cd /mnt/storage/Code/Personal/dotfiles
   ```

2. **Symlink specific configurations**:
   ```bash
   # Install individual package
   stowdot alacritty
   stowdot zsh
   stowdot tmux
   
   # Install multiple packages at once
   stowdot alacritty zsh tmux starship
   
   # Install all packages
   stowdot */
   ```

3. **Remove/Uninstall configurations**:
   ```bash
   # Remove specific package
   stowdot -D alacritty
   
   # Remove all packages
   stowdot -D */
   ```

4. **Restow (useful after updates)**:
   ```bash
   # Restow specific package
   stowdot -R zsh
   
   # Restow all packages
   stowdot -R */
   ```

## Configuration Details

### Shell Configurations

- **Zsh** (`.zshrc`): Primary shell configuration
- **Bash** (`.bashrc`): Bash shell configuration for compatibility
- **Aliases** (`.aliases`): Shared aliases across shells
- **Starship** (`starship.toml`): Cross-shell prompt configuration

### Terminal & Multiplexer

- **Alacritty** (`alacritty.toml`): GPU-accelerated terminal emulator with Catppuccin themes
- **Tmux** (`.tmux.conf`): Terminal multiplexer configuration

### Tools & Utilities

- **FZF**: Fuzzy finder configuration for both Bash and Zsh
- **Fastfetch**: System information display tool
- **Nautilus**: File manager custom scripts
  - Copy File Path
  - Open in Alacritty

### Cross-Platform

- **PowerShell**: Profile configuration for Windows

## Design Principles

- **Modularity**: Each application has its own directory for easy management
- **Clean & Clutter-Free**: Organized structure with no unnecessary files
- **Safe Operations**: Configurations include safe sourcing and conditional loading
- **Latest Stable Versions**: Always using up-to-date, stable tool versions
- **Cross-System Compatibility**: Designed to work across different systems without breaking

## Maintenance

- Configurations are regularly refactored and split into manageable parts
- Updates are made with consideration for stability and performance
- Safe fallbacks are implemented for cross-system compatibility

## Notes

- This repository is located on a separate drive from the OS installation
- Symlinks point to the `$HOME` directory using GNU Stow
- Configurations are tested on Ubuntu 24.04.3 LTS but designed for portability

## License

Personal dotfiles - use at your own discretion.

---

**Last Updated**: 09-10-2025
