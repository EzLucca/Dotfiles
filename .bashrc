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
alias mk='compiledb make && ctags -R .'
alias tmx='~/Documents/dotfiles/scripts/tmux_sessionizer.sh'
alias open='xdg-open'
alias music='mpd && mpv && ncmpcpp'
# alias ytd-mp3='yt-dlp --extract-audio --audio-format mp3 --output'
alias ytd-mp3='yt-dlp -f bestaudio -x --audio-format mp3 --audio-quality 0'

alias upgit='~/Documents/dotfiles/scripts/git_automate.sh'
# alias grademe='bash -c "$(curl https://grademe.fr)"'

# Enable bash completion
if [ -f /etc/bash_completion ]; then
	. /etc/bash_completion
fi

bind '"\t": menu-complete' # cycle with tab for options
bind 'set show-all-if-ambiguous on'
bind 'set show-all-if-unmodified on'

export PATH="$HOME/nvim:$PATH" 
export PATH="$HOME/.local/bin:$PATH"

