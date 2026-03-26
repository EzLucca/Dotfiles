#!/bin/bash

### --- Terminal check ---
if command -v wezterm >/dev/null; then
	program1="wezterm"
elif command -v xterm >/dev/null; then
	program1="xterm -geometry 80x9999+0+0 -e bash"
elif command -v gnome-terminal >/dev/null; then
	program1="gnome-terminal -- bash"
else
	echo "❌ Neither foot nor gnome-terminal found."
	exit 1
fi

### --- Firefox check ---
	if command -v flatpak >/dev/null && flatpak info org.mozilla.firefox >/dev/null 2>&1; then
	program2="flatpak run org.mozilla.firefox"
elif command -v brave >/dev/null; then
	program2="firefox"
elif [ -x /bin/brave ]; then
	program2="/bin/firefox"
else
	echo "❌ Firefox not found."
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
