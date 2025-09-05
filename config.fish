if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx PATH $HOME/nvim:$PATH
set -U fish_user_paths $HOME/.local/bin $fish_user_paths

set -g fish_greeting ""

#set -gx TERM xterm-256color

# function fish_prompt
#     set_color green  # Set the color of the prompt to green
#     echo -n (basename (pwd))  # Display the current folder name
#     set_color normal  # Reset the color after the prompt
#     echo -n ' > '  # The prompt symbol
# end

function fish_prompt
    # Check if inside a Git repository by testing for the .git directory
    set -l git_branch (git rev-parse --abbrev-ref HEAD 2>/dev/null)

    # Set color to green
    set_color green

    # If in a Git repository, show the branch name
    if test -n "$git_branch"
        echo -n (basename (pwd)) "($git_branch)"  # Show folder and Git branch
    else
        echo -n (basename (pwd))  # Just show the folder name if not in Git
    end

    # Reset color after prompt
    set_color normal
    echo -n ' > '  # The prompt symbol
end

alias norm="norminette -R CheckForbiddenSourceHeader"
alias ccc="cc -Wall -Wextra -Werror"
set -gx PATH /home/edlucca/.local/funcheck/host $PATH

alias out="ccc -g *.c && ./a.out"
alias lsa="rm a.out && la"
alias val="valgrind --leak-check=full --show-leak-kinds=all --track-fds=yes --suppressions=vg.supp --trace-children=yes"
alias mk="compiledb make"
