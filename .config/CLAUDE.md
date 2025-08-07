# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Overview

This is a comprehensive dotfiles repository containing a sophisticated development environment focused on web development (Vue.js, TypeScript, Angular). The centerpiece is a highly optimized Neovim configuration, integrated with terminal tools and productivity applications.

## Architecture

### Core Components
- **Neovim** (`/nvim/`) - Main development environment with detailed configuration (see nvim/CLAUDE.md)
- **Terminal Tools** - Ghostty terminal, tmux session management, yazi file manager
- **Development Support** - Git, GitHub CLI, language servers, formatters
- **Productivity Tools** - Raycast extensions, bat syntax highlighter, television fuzzy finder
- **System Utilities** - Karabiner keyboard customization, system monitors

### Configuration Strategy
- **Modular Organization** - Each tool has its own directory with independent configuration
- **Symlink Integration** - Shared configurations linked between nvim/terminal/ and root directories
- **Consistent Theming** - Custom "flbx" theme across multiple tools (nvim, bat, television, ghostty)
- **Performance Optimized** - Lazy loading and efficient configurations throughout

## Development Workflow

### Primary Development Environment
- **Editor**: Neovim with comprehensive plugin ecosystem (refer to nvim/CLAUDE.md for details)
- **Terminal**: Ghostty with tmux for session management
- **File Management**: Yazi file manager with custom keybindings
- **Version Control**: Git with LazyGit integration
- **AI Assistance**: GitHub Copilot and local Ollama integration

### Web Development Stack
- **Vue.js 3** with TypeScript support via Volar language server
- **Angular** development with ng-croissant and Angular language server
- **TypeScript/JavaScript** with typescript-language-server
- **CSS/Tailwind** with dedicated language servers
- **Formatting** via Prettier through conform.nvim

### Key Development Commands

**Neovim Development:**
- `:Lazy` - Plugin management
- `:Mason` - LSP server management (auto-installs volar, typescript-language-server, etc.)
- `<leader>ff` - Find files (Telescope)
- `<leader>lg` - LazyGit integration
- `<leader>ll` - Format current buffer

**Terminal Tools:**
- `tmux` - Session management with custom configurations
- `yazi` - File manager with vim-like navigation
- `television` - Fuzzy finder for quick navigation
- `bat` - Syntax highlighting with custom theme

## Directory Structure

### Configuration Locations
- `/nvim/` - Complete Neovim setup (see nvim/CLAUDE.md for comprehensive details)
- `/git/` - Git global ignore patterns
- `/gh/` - GitHub CLI configuration
- `/karabiner/` - Advanced keyboard customization
- `/raycast/` - Productivity launcher extensions
- `/terminal/` - Terminal tool configurations (ghostty, tmux, yazi)

### Language Server Configuration
Language servers are automatically installed via Mason:
- **Volar** (`vue-language-server`) - Vue.js + TypeScript
- **TypeScript** (`typescript-language-server`) - JavaScript/TypeScript
- **Angular** - Angular framework support
- **TailwindCSS**, **HTML**, **CSS** - Web development support

## Customization Guidelines

### Adding New Configurations
1. Create dedicated directory for new tool
2. Follow existing modular patterns
3. Add symlinks to nvim/terminal/ if terminal-related
4. Maintain consistent theming where applicable

### Modifying Existing Configurations
- **Neovim changes** - Refer to detailed guidance in nvim/CLAUDE.md
- **Terminal tools** - Edit configurations in respective directories
- **Theme updates** - Apply changes to flbx theme across all relevant tools

## Code Style Preferences

- **No comments in generated code** - Keep code clean and self-documenting
- **2-space indentation** for consistency across all configurations
- **Modular approach** - Each tool/plugin has its own configuration file
- **Performance first** - Use lazy loading and efficient configurations

## Integration Notes

### Terminal Integration
- Neovim includes terminal tool configurations in nvim/terminal/
- Shared configurations are symlinked to maintain consistency
- Terminal tools are designed to work seamlessly with the Neovim workflow

### AI Development Support
- GitHub Copilot integrated in Neovim
- Raycast extensions for productivity automation
- Ollama for local AI assistance

### Development Focus
This environment is specifically optimized for:
- Modern web development (Vue.js, Angular, TypeScript)
- Terminal-centric workflow
- AI-enhanced development
- High-performance editing with quick navigation
- Consistent theming and keyboard shortcuts across tools