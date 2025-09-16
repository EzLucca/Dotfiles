#!/bin/sh

# Set Session Name
SESSION="42-project"
SESSIONEXISTS=$(tmux list-sessions | grep $SESSION)

# Only create tmux session if it doesn't already exist
if [ "$SESSIONEXISTS" = "" ]
then
    # Start New Session with our name
    tmux new-session -d -s $SESSION

    # setup Writing window
    tmux new-window -t $SESSION:0 -n 'Code'
    tmux send-keys -t 'Code' "nvim ." C-m

    # # Setup an additional shell
    # tmux new-window -t $SESSION:1 -n 'Shell'
    # tmux send-keys -t 'Shell' "fish" C-m 'clear' C-m
fi

# Attach Session, on the Main window
tmux attach-session -t $SESSION:0
