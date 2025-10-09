# ---------------------------
# Basic zsh-newuser settings
# ---------------------------
HISTFILE="$HOME/.histfile"
HISTSIZE=10000
SAVEHIST=50000

setopt beep
bindkey -e            # emacs keybindings; use 'bindkey -v' for vi bindings

# Emacs-style word movement (add after `bindkey -e`)
bindkey '\e[1;5C'   forward-word
bindkey '\e[5C'     forward-word
bindkey '\e[1;9C'   forward-word

bindkey '\e[1;5D'   backward-word
bindkey '\e[5D'     backward-word
bindkey '\e[1;9D'   backward-word

# ---------------------------
# Shell behavior niceties
# ---------------------------
# cd into a directory by name
setopt autocd
# keep normal globbing behavior, but don't error when a pattern has no matches
setopt NONOMATCH
# Better history behavior
setopt share_history       # share history across sessions
setopt inc_append_history  # write each command to history immediately
setopt append_history      # append to the history file, don't overwrite
setopt hist_ignore_dups    # ignore duplicate history entries
setopt hist_reduce_blanks  # remove superfluous blanks in history

# ---------------------------
# PATH and local env
# ---------------------------
export PATH="$HOME/.local/bin:$PATH"
[ -f "$HOME/.local/bin/env" ] && source "$HOME/.local/bin/env"

# Useful environment defaults
export EDITOR="${EDITOR:-nvim}"
export PAGER="${PAGER:-less}"
export LESS="-RFX"   # allow raw control chars, quit on EOF, no init file
export LANG="${LANG:-en_US.UTF-8}"

# ---------------------------
# Deno
# ---------------------------
[ -f "$HOME/.deno/env" ] && source "$HOME/.deno/env"

# ---------------------------
# Rust (cargo)
# ---------------------------
[ -f "$HOME/.cargo/env" ] && source "$HOME/.cargo/env"

# ---------------------------
# FPATH for custom completions
# ---------------------------
FPATH_DIR="$HOME/.zsh/completions"
if [ -d "$FPATH_DIR" ] && [[ ":$FPATH:" != *":$FPATH_DIR:"* ]]; then
  FPATH="$FPATH_DIR:$FPATH"
fi
typeset -U fpath    # remove duplicates if any

# ---------------------------
# compinit (completion system)
# ---------------------------
autoload -Uz compinit
# If any secure-dir warnings pop up, run: compaudit | xargs -r chmod go-w
compinit

# ---------------------------
# zoxide (fast cd)
# ---------------------------
if command -v zoxide >/dev/null 2>&1; then
  eval "$(zoxide init zsh)"
fi

# ---------------------------
# Starship prompt
# ---------------------------
if command -v starship >/dev/null 2>&1; then
  eval "$(starship init zsh)"
fi

# ---------------------------
# zsh-autosuggestions
# ---------------------------
if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
  source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
fi

# ---------------------------
# fzf
# ---------------------------
# The installer usually creates ~/.fzf.zsh; if there isn't one, run ~/.fzf/install
if [ -f "${HOME}/.fzf.zsh" ]; then
  source "${HOME}/.fzf.zsh"
  # Recommended handy keybindings (only if fzf installed)
  # Ctrl-T to fuzzy-find files, Alt-C to cd into a selected dir, Ctrl-R to search history
  # These are normally provided by the fzf installer; the lines below are safe no-ops if the functions don't exist.
  [ -n "${FZF_CTRL_T_COMMAND:-}" ] || export FZF_CTRL_T_COMMAND='fd --type f'  # optional: faster file search if fd is present
fi

# ---------------------------
# Yazi
# ---------------------------
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	IFS= read -r -d '' cwd < "$tmp"
	[ -n "$cwd" ] && [ "$cwd" != "$PWD" ] && builtin cd -- "$cwd"
	rm -f -- "$tmp"
}

# ---------------------------
# Editor
# ---------------------------
export EDITOR="micro"
export SUDO_EDITOR="$EDITOR"

# ---------------------------
# Aliases (put any big alias list in ~/.aliases)
# ---------------------------
# Keep a single file for a long list of aliases to keep this file tidy
if [ -f "$HOME/.aliases" ]; then
  source "$HOME/.aliases"
else
  # small examples / fallbacks
  alias lzd='lazydocker'
  alias ll='ls -lah'
  alias gs='git status'
fi

# ---------------------------
# zsh-syntax-highlighting (load last)
# ---------------------------
if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
  source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi
