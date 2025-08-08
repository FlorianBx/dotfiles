# =============================================================================
# ZSH Configuration
# =============================================================================

# Core settings
export EDITOR="nvim"
export VISUAL="nvim"
export KEYTIMEOUT=1

# Enable vi mode
bindkey -v

# History configuration
HISTSIZE=5000
HISTFILE=~/.zsh_history
SAVEHIST=$HISTSIZE
HISTDUP=erase
setopt appendhistory
setopt sharehistory
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# =============================================================================
# Powerlevel10k instant prompt
# =============================================================================
# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# =============================================================================
# Homebrew
# =============================================================================
if [[ -f "/opt/homebrew/bin/brew" ]]; then
  # If you're using macOS, you'll want this enabled
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# =============================================================================
# ZINIT Plugin Manager
# =============================================================================
# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# Add in Powerlevel10k
zinit ice depth=1; zinit light romkatv/powerlevel10k

# Add in zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# Add in snippets
zinit snippet OMZL::git.zsh
zinit snippet OMZP::git
zinit snippet OMZP::sudo
# Only load archlinux plugin if on arch (commented out for macOS)
# zinit snippet OMZP::archlinux
zinit snippet OMZP::aws
zinit snippet OMZP::kubectl
zinit snippet OMZP::kubectx
zinit snippet OMZP::command-not-found

# Load completions
autoload -Uz compinit && compinit

zinit cdreplay -q

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# =============================================================================
# Path Exports
# =============================================================================
export PNPM_HOME="$HOME/Library/pnpm"
export PATH="$PNPM_HOME:$PATH"
export PATH="$PATH:/Applications/Visual Studio Code.app/Contents/Resources/app/bin"
export PATH="$PATH:/Users/florian/.lmstudio/bin"

# =============================================================================
# FZF Configuration
# =============================================================================
export FZF_DEFAULT_COMMAND='fd --type f'
export FZF_DEFAULT_OPTS='
  --height=100%
  --layout=reverse
  --preview="bat --style=numbers --color=always --line-range=:500 {}"
  --preview-window=right:60%
'

# =============================================================================
# Completion styling
# =============================================================================
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# =============================================================================
# Keybindings
# =============================================================================
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

# =============================================================================
# Aliases
# =============================================================================

# Navigation aliases
alias ..='cd ..'
alias ...='cd ../..'
alias cdf='cd "$(find . -type d | fzf)"'

# Modern replacements
alias bat='bat --theme=flbx'
alias ls="eza --icons --group-directories-first"
alias ll="eza --icons --group-directories-first --long"
alias la="eza --icons --group-directories-first --long --all"
alias el="eza --icons --group-directories-first --long --tree -L 2"
alias vim='nvim'
alias nn='nvim .'
alias youtube-dl='yt-dlp'

# Television
alias ff='tv files'

# Git aliases
alias gs='git status -s'
alias ga='git add .'
alias gA='git commit --amend'
alias gc='git commit -m'
alias gp='git push'
alias gl='git pull'
alias gb='git branch'
alias suo="--set-upstream origin"
alias gst="git stash"
alias gsp="git stash pop"

# Difftastic git commands
alias gdl="git -c diff.external=difft log -p --ext-diff"
alias gds="git -c diff.external=difft show --ext-diff"
alias gft="git -c diff.external=difft diff"

# Configuration shortcuts
alias rl="source ~/.zshrc && clear"
alias nc="nvim ~/.config/nvim/"
alias config="nvim ~/.zshrc"
alias todoc="nvim ~/.taskrc"
alias c="clear"
alias y='yazi'

# Taskwarrior
alias ta='task add'
alias tl='task list'
alias tla='task all'
alias tld='task +PENDING due:today list'
alias td='task done'
alias tn='task next'
alias tp='task purge'
alias tc='task completed'
alias th='printf "task add \"Example task\" +tag due:tomorrow | YYYY-MM-DD\n"'

# Utility aliases
alias ds-clean='find . -name .DS_Store -delete'
alias bt="shortcuts run 'Turn the Desktop Light'"
alias serv='browser-sync start --server --files "*.html, css/*.css"'

# Package manager shortcuts
alias p="pnpm"
alias pu="pnpm add -g pnpm"
alias prd="pnpm run dev"
alias prt="pnpm run test"

# Angular
alias ngn="ng new --skip-tests --style"

# Custom scripts
alias gr="python3 ~/bin/gitlab-replica/generate_contributions.py"
alias delnm="~/bin/recurse-clear-nodemodules.sh"
alias sn="~/bin/neovim-shortcuts.py"
alias sd="~/bin/download_organizer.py"
alias ffm="~/bin/toMp4.py"
alias scannet="sudo ~/bin/scan_network.sh"
alias ng-struct="~/bin/ng-struct.sh"

# =============================================================================
# Tmux Auto-launch (commented out to prevent loops)
# =============================================================================
# Uncomment if you want tmux to auto-launch (be careful of infinite loops)
# if [ -z "$TMUX" ]; then
#   tmux new-session
# fi

# =============================================================================
# Shell integrations (loaded at the end for performance)
# =============================================================================
# FZF integration
if command -v fzf &> /dev/null; then
  eval "$(fzf --zsh)"
fi

# Zoxide integration (smart cd with 'z' command)
if command -v zoxide &> /dev/null; then
  eval "$(zoxide init zsh)"
fi

# Node version manager
if command -v fnm &> /dev/null; then
  eval "$(fnm env)"
fi

# The Fuck command correction
if command -v thefuck &> /dev/null; then
  eval $(thefuck --alias)
fi

# Angular CLI autocompletion
if command -v ng &> /dev/null; then
  source <(ng completion script)
fi