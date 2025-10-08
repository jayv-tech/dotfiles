# fzf shell integration (managed via GNU Stow)
XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

# Add fzf's binary directory to PATH if not already there
if [ -d "$XDG_DATA_HOME/fzf/bin" ] && [[ ":$PATH:" != *":$XDG_DATA_HOME/fzf/bin:"* ]]; then
  export PATH="$XDG_DATA_HOME/fzf/bin:$PATH"
fi

# Source fzf's key bindings and completion scripts
if [ -f "$XDG_DATA_HOME/fzf/shell/key-bindings.zsh" ]; then
  source "$XDG_DATA_HOME/fzf/shell/key-bindings.zsh"
fi
if [ -f "$XDG_DATA_HOME/fzf/shell/completion.zsh" ]; then
  source "$XDG_DATA_HOME/fzf/shell/completion.zsh"
fi
