#!/bin/bash

### --- Terminal check ---
if command -v alacritty >/dev/null 2>&1; then
    program1=(alacritty -e tmux new-session -A -s main)
elif command -v xterm >/dev/null 2>&1; then
    program1=(xterm -geometry 80x9999+0+0 -e bash)
elif command -v gnome-terminal >/dev/null 2>&1; then
    program1=(gnome-terminal -- bash)
else
    echo "❌ No supported terminal found (Alacritty, xterm, or GNOME Terminal)."
    exit 1
fi

### --- Firefox check ---
if command -v flatpak >/dev/null 2>&1 &&
   flatpak info org.mozilla.firefox >/dev/null 2>&1; then
    program2=(flatpak run org.mozilla.firefox)
elif command -v firefox >/dev/null 2>&1; then
    program2=(firefox)
else
    echo "❌ Firefox not found."
    exit 1
fi

### --- Discord check ---
if command -v flatpak >/dev/null 2>&1 &&
   flatpak info com.discordapp.Discord >/dev/null 2>&1; then
    program3=(flatpak run com.discordapp.Discord)
elif command -v discord >/dev/null 2>&1; then
    program3=(discord)
else
    echo "❌ Discord not found."
    exit 1
fi

### --- Launch programs ---
"${program1[@]}" >/dev/null 2>&1 &
pid1=$!
"${program2[@]}" >/dev/null 2>&1 &
pid2=$!
"${program3[@]}" >/dev/null 2>&1 &
pid3=$!

disown "$pid1" "$pid2" "$pid3"
