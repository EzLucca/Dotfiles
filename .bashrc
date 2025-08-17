# Minimalist .bashrc

# --- Basic Setup ---
# Set a simple prompt
export PS1='\[\033[01;32mbash: \W\[\033[00m\] > '

# Enable Bash completion
if [ -f /etc/bash_completion ] && ! shopt -oq posix; then
    . /etc/bash_completion
fi

# --- Aliases ---
# Common aliases for frequently used commands
alias ls='ls --color=auto'
alias grep='grep --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ..='cd ..'
alias ...='cd ../..'
alias make='compiledb make'

# --- Path ---
# Add common user-specific binary paths
# export PATH="$HOME/bin:$HOME/.local/bin:$PATH"

# --- Functions ---
# Example: a simple function to create a new directory and CD into it
# mcd() {
#     mkdir -p "$1" && cd "$1"
# # }

# --- End of .bashrc ---
