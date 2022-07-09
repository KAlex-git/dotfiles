# Setup fzf
# ---------
if [[ ! "$PATH" == */home/kalex/.config/fzf/bin* ]]; then
  export PATH="$PATH:/home/kalex/.config/fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/kalex/.config/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/kalex/.config/fzf/shell/key-bindings.bash"

