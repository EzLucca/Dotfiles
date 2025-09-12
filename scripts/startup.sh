#!/bin/bash

# Programs to run
program1="gnome-terminal -- ./tmux_sessionizer.sh"
program2="flatpak run com.brave.Browser"
program3="flatpak run com.discordapp.Discord"

# # Workspaces list
# workspace1=1
# workspace2=2
# workspace3=3

$program1 &
sleep 1

$program2 &
sleep 1

$program3 &
sleep 1
