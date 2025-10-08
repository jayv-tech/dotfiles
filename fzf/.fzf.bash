# Setup fzf
# ---------
if [[ ! "$PATH" == */home/jayv/.local/share/fzf/bin* ]]; then
  PATH="${PATH:+${PATH}:}/home/jayv/.local/share/fzf/bin"
fi

eval "$(fzf --bash)"