# # Minimalist .bashrc

# Enable 256-color support
# Enable 24-bit (truecolor) support
COLOR_RESET="\[\e[0m\]"
COLOR_USER="\[\e[38;2;175;95;0m\]"      # #af5f00 - dark orange
COLOR_PATH="\[\e[38;2;95;135;95m\]"      # #5f875f - lime green
COLOR_GIT="\[\e[38;2;135;95;175m\]"     # #875faf - MediumPurple3
COLOR_HOST="\[\e[38;2;247;118;142m\]"     # #f7768e - Rosy Red
COLOR_SYMBOL="\[\e[38;2;255;255;255m\]"  # white for prompt symbol

# Function to get current git branch
parse_git_branch() {
    # Get the current branch name
    branch=$(git rev-parse --abbrev-ref HEAD 2>/dev/null)

    if [ -n "$branch" ]; then
        # Check if there are any changes (staged or unstaged)
        dirty=$(git status --porcelain 2>/dev/null)

        if [ -n "$dirty" ]; then
			echo "($branch +)"
        else
            echo "($branch)"
        fi
    fi
}

# Binary-Anomaly style prompt
# export PS1="${COLOR_USER}\u${COLOR_RESET}@${COLOR_HOST}\h${COLOR_RESET}:${COLOR_PATH}\w${COLOR_RESET}${COLOR_GIT}\$(parse_git_branch)${COLOR_RESET}\n${COLOR_SYMBOL}❯${COLOR_RESET} "
export PS1="${COLOR_USER}\u${COLOR_RESET} ${COLOR_PATH}\w${COLOR_RESET}${COLOR_GIT}\$(parse_git_branch)${COLOR_RESET}\n${COLOR_SYMBOL}❯${COLOR_RESET} "

# Optional: ls colors
if [ -x /usr/bin/dircolors ]; then
	eval "$(dircolors -b)"
	alias ls='ls --color=auto'
fi

# Aliases
alias norm='norminette -R CheckForbiddenSourceHeader'
alias ll='ls -lh'
alias la='ls -lha'
alias ccc='cc -Wall -Wextra -Werror'
alias mk='bear -- make && ctags -R .'
alias mmake='compiledb -n make && ctags -R .'
alias tmx='~/Documents/dotfiles/scripts/tmux_sessionizer.sh'
alias open='xdg-open'
alias music='mpd && mpv && ncmpcpp'
# alias ytd-mp3='yt-dlp --extract-audio --audio-format mp3 --output'
alias ytd-mp3='yt-dlp -f bestaudio -x --audio-format mp3 --audio-quality 0'
alias fltrdr="fltrdr --config-base ~/.config/fltrdr"

alias DEFCON1='valgrind --leak-check=full --track-origins=yes'
alias DEFCON2='valgrind --leak-check=full --show-leak-kinds=all'
alias DEFCON3='valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes --errors-for-leak-kinds=definite'

alias upgit='~/Documents/MySetup/dotfiles/scripts/git_automate.sh'
# alias grademe='bash -c "$(curl https://grademe.fr)"'

# Enable bash completion
if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

bind '"\t": menu-complete' # cycle with tab for options
bind 'set show-all-if-ambiguous on'
bind 'set show-all-if-unmodified on'

export PATH="$HOME/nvim/bin/:$PATH" 
export PATH="$HOME/.local/bin:$PATH"

export PATH=$HOME/local/node-v20.11.1-linux-x64/bin:$PATH

cs() {
	curl cheat.sh/"$1" | less -R
}
export PATH="$HOME/homebrew/bin:$PATH"

# annotated by dave eddy (@yousuckatprogramming)
# explained - https://youtu.be/D0sG2fj0G4Y
# borrowed heavily from https://grml.org

# Begin blinking text mode
# I just use bold red here since my terminal has blinking disabled
export LESS_TERMCAP_mb=$(tput bold; tput setaf 1)
export LESS_TERMCAP_md=$(tput bold; tput setaf 1)
export LESS_TERMCAP_me=$(tput sgr0)
export LESS_TERMCAP_se=$(tput sgr0)
export LESS_TERMCAP_so=$(tput bold; tput setaf 3; tput setab 4)
export LESS_TERMCAP_ue=$(tput sgr0)
export LESS_TERMCAP_us=$(tput smul; tput bold; tput setaf 2)
export LESS_TERMCAP_mr=$(tput rev)
export LESS_TERMCAP_mh=$(tput dim)
export LESS_TERMCAP_ZN=$(tput ssubm)
export LESS_TERMCAP_ZV=$(tput rsubm)
export LESS_TERMCAP_ZO=$(tput ssupm)
export LESS_TERMCAP_ZW=$(tput rsupm)
export MANPAGER='less'
