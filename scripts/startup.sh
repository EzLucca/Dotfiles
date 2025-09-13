#!/bin/bash

### --- Terminal check ---
if command -v foot >/dev/null; then
    program1="foot -e ./tmux_sessionizer.sh"
elif command -v gnome-terminal >/dev/null; then
    program1="gnome-terminal -- ./tmux_sessionizer.sh"
else
    echo "❌ Neither foot nor gnome-terminal found."
    exit 1
fi

### --- Brave check ---
if command -v flatpak >/dev/null && flatpak info com.brave.Browser >/dev/null 2>&1; then
    program2="flatpak run com.brave.Browser"
elif command -v brave >/dev/null; then
    program2="brave"
elif [ -x /bin/brave ]; then
    program2="/bin/brave"
else
    echo "❌ Brave not found."
    exit 1
fi

### --- Discord check ---
if command -v flatpak >/dev/null && flatpak info com.discordapp.Discord >/dev/null 2>&1; then
    program3="flatpak run com.discordapp.Discord"
elif command -v discord >/dev/null; then
    program3="discord"
else
    echo "❌ Discord not found."
    exit 1
fi

### --- Launch ---
if command -v swaymsg >/dev/null; then
    echo "🌿 Detected swaymsg → using Sway workspace launch"
    swaymsg "workspace 1; exec $program1"
    sleep 1
    swaymsg "workspace 2; exec $program2"
    sleep 1
    swaymsg "workspace 3; exec $program3"
    sleep 1
    swaymsg "workspace 1"
else
    echo "🖥️ No swaymsg → falling back to generic launch"
    $program1 &
    sleep 1
    $program2 &
    sleep 1
    $program3 &
    sleep 1
fi
